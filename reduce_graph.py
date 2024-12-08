from torch_geometric.data import Data

#bemenetnek torch geom datasetet vár
def reduce_graph(g_data):
  num_nodes = g_data.x.shape[0]

  indices = torch.randperm(num_nodes)[:2]
  #két különböző node legyen
  if indices[0] == indices[1]:
    indices[1] = (indices[1] + 1) % num_nodes
  print(indices)
  print(num_nodes)
  
  node1_neighbours = g_data.edge_index[:, g_data.edge_index[0] == indices[0]][1]
  node2_neighbours = g_data.edge_index[:, g_data.edge_index[0] == indices[1]][1]

  #print(node1_neighbours)
  #print(node2_neighbours)

  combined_nodes = torch.cat([torch.tensor([indices[0], indices[1]]), node1_neighbours, node2_neighbours])
  combined_nodes = torch.unique(combined_nodes)
  print(combined_nodes)

  combined_edge_index = g_data.edge_index[:, torch.isin(g_data.edge_index[0], combined_nodes) & torch.isin(g_data.edge_index[1], combined_nodes)]

  print(combined_edge_index.shape)

  # pytorch geom datasethez újra kell indexelni 1-től a bentmaradó nodeokat 
  old_to_new = {old_id.item(): new_id for new_id, old_id in enumerate(combined_nodes)}
  new_edge_index = torch.zeros_like(combined_edge_index)
  for i in range(combined_edge_index.size(1)):
      new_edge_index[0, i] = old_to_new[combined_edge_index[0, i].item()]
      new_edge_index[1, i] = old_to_new[combined_edge_index[1, i].item()]

  new_x = g_data.x[combined_nodes]
  new_data = Data(x=new_x, edge_index=new_edge_index)

  reindexed_indices = torch.tensor([old_to_new[idx.item()] for idx in indices])


  # new data az egy pytorch geom dataset ha az kéne. combined_edge_index az csak a connectionok nodeok között ha az elég
  return new_data, combined_edge_index, indices, reindexed_indices

#Example:
#new_data, new_edge_index, indices, reindexed_indices = reduce_graph(facebook_dataset[0])