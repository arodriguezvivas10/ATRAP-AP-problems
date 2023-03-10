(define (domain domain-3n-6s-3v)

	(:requirements :fluents :typing :equality :negative-preconditions)

	(:types 
			; INPUT FROM INFRAESTRUCTURE NETWORK PROVIDER (InP) -> SUBSTRATE NETWORK			
			; physical resources
			host-node - object 
			path - object
			; nodes			
			node1 - host-node
			node2 - host-node
			node3 - host-node					
			; Physical paths			 
			path-n1-n2 - path
			path-n1-n3 - path
			path-n2-n3 - path
			inner-path1 - path
			inner-path2 - path
			inner-path3 - path		
			
			; VIRTUAL NETWORK 
			vnf - object
			virtual-link - object
			
			; Network Slice 1 (NS) URLLC
			amf0-ns1 - vnf
			smf0-ns1 - vnf
			upf0-ns1 - vnf
			link-amf0-smf0-ns1 - virtual-link
			link-smf0-upf0-ns1 - virtual-link

			; Network Slice 2 urllc			
			amf0-ns2 - vnf
			smf0-ns2 - vnf
			upf0-ns2 - vnf
			link-amf0-smf0-ns2 - virtual-link
			link-smf0-upf0-ns2 - virtual-link	

			; Network Slice 3 urllc			
			amf0-ns3 - vnf
			smf0-ns3 - vnf
			upf0-ns3 - vnf
			link-amf0-smf0-ns3 - virtual-link
			link-smf0-upf0-ns3 - virtual-link	

			; Network Slice 4 URLLC			
			amf0-ns4 - vnf
			smf0-ns4 - vnf
			upf0-ns4 - vnf
			link-amf0-smf0-ns4 - virtual-link
			link-smf0-upf0-ns4 - virtual-link

			; Network Slice 5 urllc			
			amf0-ns5 - vnf
			smf0-ns5 - vnf
			upf0-ns5 - vnf
			link-amf0-smf0-ns5 - virtual-link
			link-smf0-upf0-ns5 - virtual-link

			; Network Slice 6 urllc			
			amf0-ns6 - vnf
			smf0-ns6 - vnf
			upf0-ns6 - vnf
			link-amf0-smf0-ns6 - virtual-link
			link-smf0-upf0-ns6 - virtual-link
	)

	(:predicates

		; PATHS
		(adjacent-nodes-i-j ?path - path ?node-i ?node-j - host-node)
		(adjacent-nodes-j-i ?path - path ?node-j ?node-i - host-node)

		; SERVICE FUNCTION CHAIN
		(next-vnf ?vnf-to-migrate ?next-vnf - vnf)

		; MAPPING: VIRTUAL -> PHYSICAL
		(vnf-mapped-to ?vnf - vnf ?h-node - host-node)
		(link-mapped-to ?virtual-link - virtual-link ?p-path - path)		
	)

	(:functions

		; SUBSTRATE NETWORK (TOTAL) RESOURCES		
        (substrate-cpu-capacity)
        (substrate-bandwidth-capacity)        

        ; VIRTUAL NETWORK REQUIREMENTS
        (vnfs-required-cpu)
        (required-bandwidth-urllc)
        (scaling-factor)

        ; EMBEDDING POTENTIAL -> AVAILABLE RESOURCES ON SUBSTRATE NETWORK
        (embedding-cpu ?h-node - host-node)
        (embedding-bandwidth ?p-path - path)
    )

    	(:action migrate-amf0-ns1

		:parameters (?vnf-to-migrate - amf0-ns1
					 ?from-node ?to-node - host-node
					 ; next vnf on SFC
					 ?next-vnf - smf0-ns1					 
					 ?smf0-ns1-node - host-node
					 ?link-to-migrate - link-amf0-smf0-ns1
					 ?from-path ?to-path - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PRECONDITIONS ASSOCIATED TO PATHS AND LINKS
					  (link-mapped-to ?link-to-migrate ?from-path)
					  (not(= ?from-path ?to-path))
					  ; enlace a migrar quede en el camino que conecta al nuevo nodo de amf-ns1 y el nodo donde est?? mapeada
					  ; smf-ns1 
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada smf-ns1
					  (vnf-mapped-to ?next-vnf ?smf0-ns1-node)
					  ; to-path -> camino entre nodo donde est?? mapeada smf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path ?smf0-ns1-node ?to-node)
					  (adjacent-nodes-j-i ?to-path ?to-node ?smf0-ns1-node)					 
					  (>= (/(embedding-bandwidth ?to-path)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; EFFECTS ON LINKS
				(link-mapped-to ?link-to-migrate ?to-path)
				(not (link-mapped-to ?link-to-migrate ?from-path))
				(decrease (embedding-bandwidth ?to-path) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path) (required-bandwidth-urllc))
			)
		)

    	(:action migrate-smf0-ns1

		:parameters (?vnf-to-migrate - smf0-ns1
					 ?from-node ?to-node - host-node
					 ; vnf previa en la sfc
					 ?prev-vnf - amf0-ns1
					 ?amf0-ns1-node - host-node
					 ?link1-to-migrate - link-amf0-smf0-ns1
					 ?from-path1 ?to-path1 - path
					 ; next vnf en la sfc
					 ?next-vnf - upf0-ns1					 				 
					 ?upf0-ns1-node - host-node
					 ?link2-to-migrate - link-smf0-upf0-ns1
					 ?from-path2 ?to-path2 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  ;(prev-vnf ?vnf-to-migrate ?prev-vnf)
					  (vnf-mapped-to ?prev-vnf ?amf0-ns1-node)
					  (adjacent-nodes-i-j ?to-path1 ?amf0-ns1-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?amf0-ns1-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)

					  ; NEXT-VNF 
					  (link-mapped-to ?link2-to-migrate ?from-path2)
					  (not (= ?from-path2 ?to-path2))
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada upf-ns1
					  (vnf-mapped-to ?next-vnf ?upf0-ns1-node)
					  ; to-path -> camino entre nodo donde est?? mapeada upf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path2 ?upf0-ns1-node ?to-node)
					  (adjacent-nodes-j-i ?to-path2 ?to-node ?upf0-ns1-node)					 
					  (>= (/(embedding-bandwidth ?to-path2)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))

				; LINK-2 MIGRADO
				(link-mapped-to ?link2-to-migrate ?to-path2)
				(not (link-mapped-to ?link2-to-migrate ?from-path2))
				(decrease (embedding-bandwidth ?to-path2) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path2) (required-bandwidth-urllc))
			)
		)

	(:action migrate-upf0-ns1

		:parameters (?vnf-to-migrate - upf0-ns1
					 ?from-node ?to-node - host-node
					 ; prev vnf en la sfc
					 ?prev-vnf - smf0-ns1					 				 
					 ?smf0-ns1-node - host-node
					 ?link1-to-migrate - link-smf0-upf0-ns1
					 ?from-path1 ?to-path1 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?smf0-ns1-node)
					  (adjacent-nodes-i-j ?to-path1 ?smf0-ns1-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?smf0-ns1-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))
			)
		)

	(:action migrate-amf0-ns2

		:parameters (?vnf-to-migrate - amf0-ns2
					 ?from-node ?to-node - host-node
					 ; next vnf on SFC
					 ?next-vnf - smf0-ns2					 
					 ?smf0-ns2-node - host-node
					 ?link-to-migrate - link-amf0-smf0-ns2
					 ?from-path ?to-path - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PRECONDITIONS ASSOCIATED TO PATHS AND LINKS
					  (link-mapped-to ?link-to-migrate ?from-path)
					  (not(= ?from-path ?to-path))
					  ; enlace a migrar quede en el camino que conecta al nuevo nodo de amf-ns1 y el nodo donde est?? mapeada
					  ; smf-ns1 
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada smf-ns1
					  (vnf-mapped-to ?next-vnf ?smf0-ns2-node)
					  ; to-path -> camino entre nodo donde est?? mapeada smf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path ?smf0-ns2-node ?to-node)
					  (adjacent-nodes-j-i ?to-path ?to-node ?smf0-ns2-node)					 
					  (>= (/(embedding-bandwidth ?to-path)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; EFFECTS ON LINKS
				(link-mapped-to ?link-to-migrate ?to-path)
				(not (link-mapped-to ?link-to-migrate ?from-path))
				(decrease (embedding-bandwidth ?to-path) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path) (required-bandwidth-urllc))
			)
		)

	(:action migrate-smf0-ns2

		:parameters (?vnf-to-migrate - smf0-ns2
					 ?from-node ?to-node - host-node
					 ; vnf previa en la sfc
					 ?prev-vnf - amf0-ns2
					 ?amf0-ns2-node - host-node
					 ?link1-to-migrate - link-amf0-smf0-ns2
					 ?from-path1 ?to-path1 - path
					 ; next vnf en la sfc
					 ?next-vnf - upf0-ns2					 				 
					 ?upf0-ns2-node - host-node
					 ?link2-to-migrate - link-smf0-upf0-ns2
					 ?from-path2 ?to-path2 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?amf0-ns2-node)
					  (adjacent-nodes-i-j ?to-path1 ?amf0-ns2-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?amf0-ns2-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)

					  ; NEXT-VNF 
					  (link-mapped-to ?link2-to-migrate ?from-path2)
					  (not (= ?from-path2 ?to-path2))
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada upf-ns1
					  (vnf-mapped-to ?next-vnf ?upf0-ns2-node)
					  ; to-path -> camino entre nodo donde est?? mapeada upf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path2 ?upf0-ns2-node ?to-node)
					  (adjacent-nodes-j-i ?to-path2 ?to-node ?upf0-ns2-node)					 
					  (>= (/(embedding-bandwidth ?to-path2)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))

				; LINK-2 MIGRADO
				(link-mapped-to ?link2-to-migrate ?to-path2)
				(not (link-mapped-to ?link2-to-migrate ?from-path2))
				(decrease (embedding-bandwidth ?to-path2) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path2) (required-bandwidth-urllc))
			)
		)

		(:action migrate-upf0-ns2

		:parameters (?vnf-to-migrate - upf0-ns2
					 ?from-node ?to-node - host-node
					 ; prev vnf en la sfc
					 ?prev-vnf - smf0-ns2					 				 
					 ?smf0-ns2-node - host-node
					 ?link1-to-migrate - link-smf0-upf0-ns2
					 ?from-path1 ?to-path1 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?smf0-ns2-node)
					  (adjacent-nodes-i-j ?to-path1 ?smf0-ns2-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?smf0-ns2-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))
		)
		)

		(:action migrate-amf0-ns3

		:parameters (?vnf-to-migrate - amf0-ns3
					 ?from-node ?to-node - host-node
					 ; next vnf on SFC
					 ?next-vnf - smf0-ns3					 
					 ?smf0-ns3-node - host-node
					 ?link-to-migrate - link-amf0-smf0-ns3
					 ?from-path ?to-path - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PRECONDITIONS ASSOCIATED TO PATHS AND LINKS
					  (link-mapped-to ?link-to-migrate ?from-path)
					  (not(= ?from-path ?to-path))
					  ; enlace a migrar quede en el camino que conecta al nuevo nodo de amf-ns1 y el nodo donde est?? mapeada
					  ; smf-ns1 
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada smf-ns1
					  (vnf-mapped-to ?next-vnf ?smf0-ns3-node)
					  ; to-path -> camino entre nodo donde est?? mapeada smf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path ?smf0-ns3-node ?to-node)
					  (adjacent-nodes-j-i ?to-path ?to-node ?smf0-ns3-node)					 
					  (>= (/(embedding-bandwidth ?to-path)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; EFFECTS ON LINKS
				(link-mapped-to ?link-to-migrate ?to-path)
				(not (link-mapped-to ?link-to-migrate ?from-path))
				(decrease (embedding-bandwidth ?to-path) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path) (required-bandwidth-urllc))
			)
		)

    	(:action migrate-smf0-ns3

		:parameters (?vnf-to-migrate - smf0-ns3
					 ?from-node ?to-node - host-node
					 ; vnf previa en la sfc
					 ?prev-vnf - amf0-ns3
					 ?amf0-ns3-node - host-node
					 ?link1-to-migrate - link-amf0-smf0-ns3
					 ?from-path1 ?to-path1 - path
					 ; next vnf en la sfc
					 ?next-vnf - upf0-ns3					 				 
					 ?upf0-ns3-node - host-node
					 ?link2-to-migrate - link-smf0-upf0-ns3
					 ?from-path2 ?to-path2 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  ;(prev-vnf ?vnf-to-migrate ?prev-vnf)
					  (vnf-mapped-to ?prev-vnf ?amf0-ns3-node)
					  (adjacent-nodes-i-j ?to-path1 ?amf0-ns3-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?amf0-ns3-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)

					  ; NEXT-VNF 
					  (link-mapped-to ?link2-to-migrate ?from-path2)
					  (not (= ?from-path2 ?to-path2))
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada upf-ns1
					  (vnf-mapped-to ?next-vnf ?upf0-ns3-node)
					  ; to-path -> camino entre nodo donde est?? mapeada upf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path2 ?upf0-ns3-node ?to-node)
					  (adjacent-nodes-j-i ?to-path2 ?to-node ?upf0-ns3-node)					 
					  (>= (/(embedding-bandwidth ?to-path2)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))

				; LINK-2 MIGRADO
				(link-mapped-to ?link2-to-migrate ?to-path2)
				(not (link-mapped-to ?link2-to-migrate ?from-path2))
				(decrease (embedding-bandwidth ?to-path2) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path2) (required-bandwidth-urllc))
			)
		)

	(:action migrate-upf0-ns3

		:parameters (?vnf-to-migrate - upf0-ns3
					 ?from-node ?to-node - host-node
					 ; prev vnf en la sfc
					 ?prev-vnf - smf0-ns3					 				 
					 ?smf0-ns3-node - host-node
					 ?link1-to-migrate - link-smf0-upf0-ns3
					 ?from-path1 ?to-path1 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?smf0-ns3-node)
					  (adjacent-nodes-i-j ?to-path1 ?smf0-ns3-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?smf0-ns3-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))
			)
		)

	(:action migrate-amf0-ns4

		:parameters (?vnf-to-migrate - amf0-ns4
					 ?from-node ?to-node - host-node
					 ; next vnf on SFC
					 ?next-vnf - smf0-ns4					 
					 ?smf0-ns4-node - host-node
					 ?link-to-migrate - link-amf0-smf0-ns4
					 ?from-path ?to-path - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PRECONDITIONS ASSOCIATED TO PATHS AND LINKS
					  (link-mapped-to ?link-to-migrate ?from-path)
					  (not(= ?from-path ?to-path))
					  ; enlace a migrar quede en el camino que conecta al nuevo nodo de amf-ns1 y el nodo donde est?? mapeada
					  ; smf-ns1 
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada smf-ns1
					  (vnf-mapped-to ?next-vnf ?smf0-ns4-node)
					  ; to-path -> camino entre nodo donde est?? mapeada smf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path ?smf0-ns4-node ?to-node)
					  (adjacent-nodes-j-i ?to-path ?to-node ?smf0-ns4-node)					 
					  (>= (/(embedding-bandwidth ?to-path)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; EFFECTS ON LINKS
				(link-mapped-to ?link-to-migrate ?to-path)
				(not (link-mapped-to ?link-to-migrate ?from-path))
				(decrease (embedding-bandwidth ?to-path) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path) (required-bandwidth-urllc))
			)
		)

    	(:action migrate-smf0-ns4

		:parameters (?vnf-to-migrate - smf0-ns4
					 ?from-node ?to-node - host-node
					 ; vnf previa en la sfc
					 ?prev-vnf - amf0-ns4
					 ?amf0-ns4-node - host-node
					 ?link1-to-migrate - link-amf0-smf0-ns4
					 ?from-path1 ?to-path1 - path
					 ; next vnf en la sfc
					 ?next-vnf - upf0-ns4					 				 
					 ?upf0-ns4-node - host-node
					 ?link2-to-migrate - link-smf0-upf0-ns4
					 ?from-path2 ?to-path2 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  ;(prev-vnf ?vnf-to-migrate ?prev-vnf)
					  (vnf-mapped-to ?prev-vnf ?amf0-ns4-node)
					  (adjacent-nodes-i-j ?to-path1 ?amf0-ns4-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?amf0-ns4-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)

					  ; NEXT-VNF 
					  (link-mapped-to ?link2-to-migrate ?from-path2)
					  (not (= ?from-path2 ?to-path2))
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada upf-ns1
					  (vnf-mapped-to ?next-vnf ?upf0-ns4-node)
					  ; to-path -> camino entre nodo donde est?? mapeada upf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path2 ?upf0-ns4-node ?to-node)
					  (adjacent-nodes-j-i ?to-path2 ?to-node ?upf0-ns4-node)					 
					  (>= (/(embedding-bandwidth ?to-path2)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))

				; LINK-2 MIGRADO
				(link-mapped-to ?link2-to-migrate ?to-path2)
				(not (link-mapped-to ?link2-to-migrate ?from-path2))
				(decrease (embedding-bandwidth ?to-path2) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path2) (required-bandwidth-urllc))
			)
		)

	(:action migrate-upf0-ns4

		:parameters (?vnf-to-migrate - upf0-ns4
					 ?from-node ?to-node - host-node
					 ; prev vnf en la sfc
					 ?prev-vnf - smf0-ns4				 				 
					 ?smf0-ns4-node - host-node
					 ?link1-to-migrate - link-smf0-upf0-ns4
					 ?from-path1 ?to-path1 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?smf0-ns4-node)
					  (adjacent-nodes-i-j ?to-path1 ?smf0-ns4-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?smf0-ns4-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))
			)
		)

	(:action migrate-amf0-ns5

		:parameters (?vnf-to-migrate - amf0-ns5
					 ?from-node ?to-node - host-node
					 ; next vnf on SFC
					 ?next-vnf - smf0-ns5					 
					 ?smf0-ns5-node - host-node
					 ?link-to-migrate - link-amf0-smf0-ns5
					 ?from-path ?to-path - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PRECONDITIONS ASSOCIATED TO PATHS AND LINKS
					  (link-mapped-to ?link-to-migrate ?from-path)
					  (not(= ?from-path ?to-path))
					  ; enlace a migrar quede en el camino que conecta al nuevo nodo de amf-ns1 y el nodo donde est?? mapeada
					  ; smf-ns1 
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada smf-ns1
					  (vnf-mapped-to ?next-vnf ?smf0-ns5-node)
					  ; to-path -> camino entre nodo donde est?? mapeada smf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path ?smf0-ns5-node ?to-node)
					  (adjacent-nodes-j-i ?to-path ?to-node ?smf0-ns5-node)					 
					  (>= (/(embedding-bandwidth ?to-path)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; EFFECTS ON LINKS
				(link-mapped-to ?link-to-migrate ?to-path)
				(not (link-mapped-to ?link-to-migrate ?from-path))
				(decrease (embedding-bandwidth ?to-path) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path) (required-bandwidth-urllc))
			)
		)

	(:action migrate-smf0-ns5

		:parameters (?vnf-to-migrate - smf0-ns5
					 ?from-node ?to-node - host-node
					 ; vnf previa en la sfc
					 ?prev-vnf - amf0-ns5
					 ?amf0-ns5-node - host-node
					 ?link1-to-migrate - link-amf0-smf0-ns5
					 ?from-path1 ?to-path1 - path
					 ; next vnf en la sfc
					 ?next-vnf - upf0-ns5					 				 
					 ?upf0-ns5-node - host-node
					 ?link2-to-migrate - link-smf0-upf0-ns5
					 ?from-path2 ?to-path2 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?amf0-ns5-node)
					  (adjacent-nodes-i-j ?to-path1 ?amf0-ns5-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?amf0-ns5-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)

					  ; NEXT-VNF 
					  (link-mapped-to ?link2-to-migrate ?from-path2)
					  (not (= ?from-path2 ?to-path2))
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada upf-ns1
					  (vnf-mapped-to ?next-vnf ?upf0-ns5-node)
					  ; to-path -> camino entre nodo donde est?? mapeada upf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path2 ?upf0-ns5-node ?to-node)
					  (adjacent-nodes-j-i ?to-path2 ?to-node ?upf0-ns5-node)					 
					  (>= (/(embedding-bandwidth ?to-path2)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))

				; LINK-2 MIGRADO
				(link-mapped-to ?link2-to-migrate ?to-path2)
				(not (link-mapped-to ?link2-to-migrate ?from-path2))
				(decrease (embedding-bandwidth ?to-path2) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path2) (required-bandwidth-urllc))
			)
		)

		(:action migrate-upf0-ns5

		:parameters (?vnf-to-migrate - upf0-ns5
					 ?from-node ?to-node - host-node
					 ; prev vnf en la sfc
					 ?prev-vnf - smf0-ns5					 				 
					 ?smf0-ns5-node - host-node
					 ?link1-to-migrate - link-smf0-upf0-ns5
					 ?from-path1 ?to-path1 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?smf0-ns5-node)
					  (adjacent-nodes-i-j ?to-path1 ?smf0-ns5-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?smf0-ns5-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))
		)
		)

		(:action migrate-amf0-ns6

		:parameters (?vnf-to-migrate - amf0-ns6
					 ?from-node ?to-node - host-node
					 ; next vnf on SFC
					 ?next-vnf - smf0-ns6					 
					 ?smf0-ns6-node - host-node
					 ?link-to-migrate - link-amf0-smf0-ns6
					 ?from-path ?to-path - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PRECONDITIONS ASSOCIATED TO PATHS AND LINKS
					  (link-mapped-to ?link-to-migrate ?from-path)
					  (not(= ?from-path ?to-path))
					  ; enlace a migrar quede en el camino que conecta al nuevo nodo de amf-ns1 y el nodo donde est?? mapeada
					  ; smf-ns1 
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada smf-ns1
					  (vnf-mapped-to ?next-vnf ?smf0-ns6-node)
					  ; to-path -> camino entre nodo donde est?? mapeada smf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path ?smf0-ns6-node ?to-node)
					  (adjacent-nodes-j-i ?to-path ?to-node ?smf0-ns6-node)					 
					  (>= (/(embedding-bandwidth ?to-path)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; EFFECTS ON LINKS
				(link-mapped-to ?link-to-migrate ?to-path)
				(not (link-mapped-to ?link-to-migrate ?from-path))
				(decrease (embedding-bandwidth ?to-path) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path) (required-bandwidth-urllc))
			)
		)

    	(:action migrate-smf0-ns6

		:parameters (?vnf-to-migrate - smf0-ns6
					 ?from-node ?to-node - host-node
					 ; vnf previa en la sfc
					 ?prev-vnf - amf0-ns6
					 ?amf0-ns6-node - host-node
					 ?link1-to-migrate - link-amf0-smf0-ns6
					 ?from-path1 ?to-path1 - path
					 ; next vnf en la sfc
					 ?next-vnf - upf0-ns6					 				 
					 ?upf0-ns6-node - host-node
					 ?link2-to-migrate - link-smf0-upf0-ns6
					 ?from-path2 ?to-path2 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  ;(prev-vnf ?vnf-to-migrate ?prev-vnf)
					  (vnf-mapped-to ?prev-vnf ?amf0-ns6-node)
					  (adjacent-nodes-i-j ?to-path1 ?amf0-ns6-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?amf0-ns6-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)

					  ; NEXT-VNF 
					  (link-mapped-to ?link2-to-migrate ?from-path2)
					  (not (= ?from-path2 ?to-path2))
					  (next-vnf ?vnf-to-migrate ?next-vnf)
					  ; nodo donde est?? mapeada upf-ns1
					  (vnf-mapped-to ?next-vnf ?upf0-ns6-node)
					  ; to-path -> camino entre nodo donde est?? mapeada upf-ns1 y to-node
					  (adjacent-nodes-i-j ?to-path2 ?upf0-ns6-node ?to-node)
					  (adjacent-nodes-j-i ?to-path2 ?to-node ?upf0-ns6-node)					 
					  (>= (/(embedding-bandwidth ?to-path2)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))

				; LINK-2 MIGRADO
				(link-mapped-to ?link2-to-migrate ?to-path2)
				(not (link-mapped-to ?link2-to-migrate ?from-path2))
				(decrease (embedding-bandwidth ?to-path2) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path2) (required-bandwidth-urllc))
			)
		)

	(:action migrate-upf0-ns6

		:parameters (?vnf-to-migrate - upf0-ns6
					 ?from-node ?to-node - host-node
					 ; prev vnf en la sfc
					 ?prev-vnf - smf0-ns6					 				 
					 ?smf0-ns6-node - host-node
					 ?link1-to-migrate - link-smf0-upf0-ns6
					 ?from-path1 ?to-path1 - path
					 )

		:precondition(and
					  ; PRECONDITIONS ASSOCIATED TO NODES AND VNFs
					  (vnf-mapped-to ?vnf-to-migrate ?from-node)
					  (not(= ?from-node ?to-node))
					  (>= (/(embedding-cpu ?to-node)(*(scaling-factor)(vnfs-required-cpu))) 1)

					  ; PREV-VNF
					  (link-mapped-to ?link1-to-migrate ?from-path1)
					  (not(= ?from-path1 ?to-path1))
					  (next-vnf ?prev-vnf ?vnf-to-migrate)
					  (vnf-mapped-to ?prev-vnf ?smf0-ns6-node)
					  (adjacent-nodes-i-j ?to-path1 ?smf0-ns6-node ?to-node)
					  (adjacent-nodes-j-i ?to-path1 ?to-node ?smf0-ns6-node)
					  (>= (/(embedding-bandwidth ?to-path1)(required-bandwidth-urllc)) 1)
					 )

		:effect( and
				; EFFECTS ON NODES
				(vnf-mapped-to ?vnf-to-migrate ?to-node)
				(not (vnf-mapped-to ?vnf-to-migrate ?from-node))
				(decrease (embedding-cpu ?to-node) (*(scaling-factor)(vnfs-required-cpu)))
				(increase (embedding-cpu ?from-node) (*(scaling-factor)(vnfs-required-cpu)))

				; LINK-1 MIGRADO
				(link-mapped-to ?link1-to-migrate ?to-path1)
				(not (link-mapped-to ?link1-to-migrate ?from-path1))
				(decrease (embedding-bandwidth ?to-path1) (required-bandwidth-urllc))
				(increase (embedding-bandwidth ?from-path1) (required-bandwidth-urllc))
			)
		)
)	




