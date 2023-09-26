"""
    spatial_scaling(N_obj::Vector, M::UnipartiteProbabilisticNetwork, A::Float64)

Calculates the expected number of links in all local networks between latitudes of length (or difference) A, covering the entire range of latitudes in the dataset. 

The expected number of links is obtained in two ways. 
(1) The sum of the expected numbers of links of all local networks inside the window.
(2) The expected number of links of the overall network obtained after merging each local network in the window.
"""
function spatial_scaling(N_obj::Vector, M::UnipartiteProbabilisticNetwork, A::Float64)
  
    # sites_lat is a dataframe of latitude data for each site
    latitudes = sites_lat.latitude

    # get lowest and highest latitudes to build the lats vector
    low_lat = quantile(latitudes, 0.025)
    high_lat = quantile(latitudes, 0.975)
    
    # get regular sequence of latitudes by increment of A
    lats = [low_lat:A:high_lat;]

    # make objects for the expected numbers of links for the 2 methods
    links_sum = zeros(Float64, length(lats) - 1)
    links_merged = zeros(Float64, length(lats) - 1)

    # calculate the expected numbers of links of networks between two latitudes
    for k in 1:(length(lats) - 1)
        
        # empty object for merged networks
        N_acc = []
    
        # find index of all networks between two latitudes
        ind = findall(latitudes .>= lats[k] .&& latitudes .< lats[k+1])
          
        # keep the number of links at 0 if there is no network between latitudes of index k and k+1
        if length(ind) > 0

        # find all networks between the two latitudes
        Ns_ind = [N_obj[i].N_prob for i in ind]
        
        # calculate the sum of all expected numbers of links
        links_sum[k] = sum(links.(Ns_ind))
    
        # add a first network to the object for merged networks
        N_acc = N_obj[ind[1]]

        # merge all networks found between two latitudes
        for i in 2:length(ind)
            N_acc = merge_networks(N_acc, N_obj[ind[i]], M)
        end
    
        # calculate the expected number of links of the merged networks
        links_merged[k] = links(N_acc.N_prob)
        end
    end
    return (links_sum = links_sum, links_merged = links_merged)
end




