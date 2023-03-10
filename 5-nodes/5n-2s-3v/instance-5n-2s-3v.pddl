(define (problem instance-5n-2s-3v)

	(:domain domain-5n-2s-3v)

	(:objects
		; SUBSTRATE NETWORK
		; Physical Nodes
		n1 - node1
		n2 - node2
		n3 - node3
		n4 - node4
		n5 - node5
		; Physical Paths
		; All paths are bidirectionals
		n1-n2 - path-n1-n2
		n1-n3 - path-n1-n3
		n2-n4 - path-n2-n4
		n3-n4 - path-n3-n4
		n1-n4 - c-path-n1-n4
		n2-n3 - c-path-n2-n3
		n1-n5 - path-n1-n5
		n2-n5 - path-n2-n5
		n3-n5 - path-n3-n5
		n4-n5 - path-n4-n5
		inner-path-n1 - inner-path1
		inner-path-n2 - inner-path2
		inner-path-n3 - inner-path3
		inner-path-n4 - inner-path4
		inner-path-n5 - inner-path5

		; Network Slice 1 -> URLLC
		amf0-1 - amf0-ns1
		smf0-1 - smf0-ns1 
		upf0-1 - upf0-ns1
		amf0-smf0-1 - link-amf0-smf0-ns1
		smf0-upf0-1 - link-smf0-upf0-ns1

		; Network Slice 2 -> mMTC
		amf0-2 - amf0-ns2
		smf0-2 - smf0-ns2
		upf0-2 - upf0-ns2
		amf0-smf0-2 - link-amf0-smf0-ns2
		smf0-upf0-2 - link-smf0-upf0-ns2
		)

	(:init
		(=(substrate-cpu-capacity) 112) ; 4 CPUs x 28 cores
        (=(substrate-bandwidth-capacity) 200) ; Mbps
		(=(vnfs-required-cpu) 4.0)
        (=(required-bandwidth-urllc) 20)
        (=(scaling-factor) 12)

		; SUBSTRATE NETWORK
		; All paths are bidirectionals
		(adjacent-nodes-i-j n1-n2 n1 n2)
		(adjacent-nodes-j-i n1-n2 n2 n1)

		(adjacent-nodes-i-j n1-n3 n1 n3)
		(adjacent-nodes-j-i n1-n3 n3 n1)

		(adjacent-nodes-i-j n2-n3 n2 n3)
		(adjacent-nodes-j-i n2-n3 n3 n2)

		(adjacent-nodes-i-j n3-n4 n3 n4)
		(adjacent-nodes-j-i n3-n4 n4 n3)

		(adjacent-nodes-i-j n1-n4 n1 n4)
		(adjacent-nodes-j-i n1-n4 n1 n4)

		(adjacent-nodes-i-j n2-n4 n2 n4)
		(adjacent-nodes-j-i n2-n4 n4 n2)

		(adjacent-nodes-i-j n1-n5 n1 n5)
		(adjacent-nodes-j-i n1-n5 n5 n1)

		(adjacent-nodes-i-j n2-n5 n2 n5)
		(adjacent-nodes-j-i n2-n5 n5 n2)

		(adjacent-nodes-i-j n3-n5 n3 n5)
		(adjacent-nodes-j-i n3-n5 n5 n3)

		(adjacent-nodes-i-j n4-n5 n4 n5)
		(adjacent-nodes-j-i n4-n5 n5 n4)

		(adjacent-nodes-i-j inner-path-n1 n1 n1)
		(adjacent-nodes-j-i inner-path-n1 n1 n1)

		(adjacent-nodes-i-j inner-path-n2 n2 n2)
		(adjacent-nodes-j-i inner-path-n2 n2 n2)

		(adjacent-nodes-i-j inner-path-n3 n3 n3)
		(adjacent-nodes-j-i inner-path-n3 n3 n3)

		(adjacent-nodes-i-j inner-path-n4 n4 n4)
		(adjacent-nodes-j-i inner-path-n4 n4 n4)

		(adjacent-nodes-i-j inner-path-n5 n5 n5)
		(adjacent-nodes-j-i inner-path-n5 n5 n5)

		; VIRTUAL NETWORK
		; All VMs instances of a VNF are placed in the same host node.

		; NETWORK SLICE 1 -> URLLC (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-1 smf0-1)
		(next-vnf smf0-1 upf0-1)
		; vnfs mappings
		(vnf-mapped-to amf0-1 n1) 
		(vnf-mapped-to smf0-1 n2)
		(vnf-mapped-to upf0-1 n3)
		;links mappings
		(link-mapped-to amf0-smf0-1 n1-n2)
		(link-mapped-to smf0-upf0-1 n2-n3)

		; NETWORK SLICE 2 -> mMTC (SERVICE FUNCTION CHAIN)	
		(next-vnf amf0-2 smf0-2)
		(next-vnf smf0-2 upf0-2)
		; vnfs mappings
		(vnf-mapped-to amf0-2 n4)
		(vnf-mapped-to smf0-2 n5)
		(vnf-mapped-to upf0-2 n1)
		;links mappings
		(link-mapped-to amf0-smf0-2 n4-n5)
		(link-mapped-to smf0-upf0-2 n1-n5)

		; AVAILABILITY OF RESOURCES IN SUBSTRATE

		(=(embedding-cpu n1) 16)
		(=(embedding-cpu n2) 64)
		(=(embedding-cpu n3) 64)
		(=(embedding-cpu n4) 64)
		(=(embedding-cpu n5) 64)

		(= (embedding-bandwidth n1-n2) 180)
		(= (embedding-bandwidth n1-n3) 200)
		(= (embedding-bandwidth n2-n4) 200)
		(= (embedding-bandwidth n3-n4) 200)
		(= (embedding-bandwidth n1-n4) 200)
		(= (embedding-bandwidth n2-n3) 180)
		(= (embedding-bandwidth n1-n5) 180)
		(= (embedding-bandwidth n2-n5) 200)
		(= (embedding-bandwidth n3-n5) 200)
		(= (embedding-bandwidth n4-n5) 180)
		(= (embedding-bandwidth inner-path-n1) 40000000)
		(= (embedding-bandwidth inner-path-n2) 40000000)
		(= (embedding-bandwidth inner-path-n3) 40000000)
		(= (embedding-bandwidth inner-path-n4) 40000000)
		(= (embedding-bandwidth inner-path-n5) 40000000)
		)

	(:goal (and
			; CPU INTENT FROM NETWORK SLICE TENANT 
			; Distribute the load in the network host nodes as evenly as possible	
			(>(embedding-cpu n1)16)

			; BANDWIDTH INTENT FROM NETWORK SLICE TENANT
			; Ning??n camino tenga m??s de un enlace 
			;(=(embedding-bandwidth n1-n2)(substrate-bandwidth-capacity))
			;(<(embedding-bandwidth n1-n3)(substrate-bandwidth-capacity))
		)
	)
)
