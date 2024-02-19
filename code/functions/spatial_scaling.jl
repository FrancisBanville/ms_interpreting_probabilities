"""
    spatial_scaling(N_obj::Vector, M::UnipartiteProbabilisticNetwork, lats::Vector, A::Float64)

Calculates the connectance of all networks (local and potential) within latitudinal windows of length A centered at each latitudes in lats.

This function has two outputs: 
(1) The connectance of the overall network obtained after merging each local network in the windows.
(2) The connectance in the submetaweb of all species in the windows. 
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

        # keep connectance at 0 if there is no network between latitudes of index k and k+1
        if length(ind) > 0
        
            #### expected connectance in the submetaweb 

            # find all networks in the window
            Ns_ind = [N_obj[i].N_prob for i in ind]
        
            # get all species found in the window
            sp_ind = unique(reduce(vcat, species.(Ns_ind)))

            # calculate the connectance of the metaweb 
            links_metaweb[k] = connectance(M[sp_ind])

            #### connectance in the merged network 
        
            # make object for merged networks that will be updated in loop
            N_acc = N_obj[ind[1]]
        
            # merge all networks found in the window
            for i in 2:length(ind)
                N_acc = merge_networks(N_acc, N_obj[ind[i]], M)
            end
    
            # calculate the connectance of links of the merged networks
            links_merged[k] = connectance(N_acc.N_prob)
        end
    end
    return (links_merged = links_merged, links_metaweb = links_metaweb)
end


