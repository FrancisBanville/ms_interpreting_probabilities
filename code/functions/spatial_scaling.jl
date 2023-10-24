"""
    spatial_scaling(N_obj::Vector, M::UnipartiteProbabilisticNetwork, lats::Vector, A::Float64)

Calculates the expected number of links in all networks (local and potential) within latitudinal windows of length A centered at each latitudes in lats.

This function has two outputs: 
(1) The expected number of links of the overall network obtained after merging each local network in the windows.
(2) The expected number of links in the submetaweb of all species in the windows. 
"""
function spatial_scaling(N_obj::Vector, M::UnipartiteProbabilisticNetwork, lats::Vector, A::Float64)

    # sites_lat is a dataframe of latitude data for each site
    latitudes = sites_lat.latitude

    # make empty objects for the expected numbers of links in the merged network and submetaweb
    links_merged = zeros(Float64, length(lats))
    links_metaweb = zeros(Float64, length(lats))

    for k in 1:length(lats)

        # find index of all networks within a latitudinal window of length A centered at a given latitude
        ind = findall(latitudes .>= lats[k] - A/2 .&& latitudes .< lats[k] + A/2)

        # keep the number of links at 0 if there is no network between latitudes of index k and k+1
        if length(ind) > 0
        
            #### expected number of links in the submetaweb 

            # find all networks in the window
            Ns_ind = [N_obj[i].N_prob for i in ind]
        
            # get all species found in the window
            sp_ind = unique(reduce(vcat, species.(Ns_ind)))

            # calculate the expected number of links of the metaweb 
            links_metaweb[k] = links(M[sp_ind])

            #### expected number of links in the merged network 
        
            # make empty object for merged networks
            N_acc = []
            
            # add a first network to that object 
            N_acc = N_obj[ind[1]]
        
            # merge all networks found in the window
            for i in 2:length(ind)
                N_acc = merge_networks(N_acc, N_obj[ind[i]], M)
            end
    
            # calculate the expected number of links of the merged networks
            links_merged[k] = links(N_acc.N_prob)
        end
    end
    return (links_merged = links_merged, links_metaweb = links_metaweb)
end


