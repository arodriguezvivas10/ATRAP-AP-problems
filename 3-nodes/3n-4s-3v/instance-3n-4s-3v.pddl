(define (problem instance-3n-4s-3v)

	(:domain domain-3n-4s-3v)

	(:objects
		; SUBSTRATE NETWORK
		; Physical Nodes
		n1 - node1
		n2 - node2
		n3 - node3
		;n4 - node4
		; Physical Paths
		; All paths are bidirectionals
		n1-n2 - path-n1-n2
		n1-n3 - path-n1-n3
		n2-n3 - path-n2-n3
		inner-path-n1 - inner-path1
		inner-path-n2 - inner-path2
		inner-path-n3 - inner-path3

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

		; Network Slice 3 -> eMBB
		amf0-3 - amf0-ns3
		smf0-3 - smf0-ns3 
		upf0-3 - upf0-ns3
		amf0-smf0-3 - link-amf0-smf0-ns3
		smf0-upf0-3 - link-smf0-upf0-ns3

		; Network Slice 4 -> mMTC
		amf0-4 - amf0-ns4
		smf0-4 - smf0-ns4
		upf0-4 - upf0-ns4
		amf0-smf0-4 - link-amf0-smf0-ns4
		smf0-upf0-4 - link-smf0-upf0-ns4
		)

	(:init
		(=(substrate-cpu-capacity) 112) ; 4 CPUs x 28 cores
        (=(substrate-bandwidth-capacity) 200) ; Mbps
		(=(vnfs-required-cpu) 4.0)
        (=(required-bandwidth-urllc) 20)
        (=(scaling-factor) 4)

		; SUBSTRATE NETWORK
		; All paths are bidirectionals
		(adjacent-nodes-i-j n1-n2 n1 n2)
		(adjacent-nodes-j-i n1-n2 n2 n1)

		(adjacent-nodes-i-j n1-n3 n1 n3)
		(adjacent-nodes-j-i n1-n3 n3 n1)

		(adjacent-nodes-i-j n2-n3 n2 n3)
		(adjacent-nodes-j-i n2-n3 n3 n2)

		(adjacent-nodes-i-j inner-path-n1 n1 n1)
		(adjacent-nodes-j-i inner-path-n1 n1 n1)

		(adjacent-nodes-i-j inner-path-n2 n2 n2)
		(adjacent-nodes-j-i inner-path-n2 n2 n2)

		(adjacent-nodes-i-j inner-path-n3 n3 n3)
		(adjacent-nodes-j-i inner-path-n3 n3 n3)

		; VIRTUAL NETWORK
		; All VMs instances of a VNF are placed in the same host node.

		; NETWORK SLICE 1 -> URLLC (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-1 smf0-1)
		(next-vnf smf0-1 upf0-1)
		; vnfs mappings
		(vnf-mapped-to amf0-1 n2) 
		(vnf-mapped-to smf0-1 n3)
		(vnf-mapped-to upf0-1 n2)
		;links mappings
		(link-mapped-to amf0-smf0-1 n2-n3)
		(link-mapped-to smf0-upf0-1 n2-n3)

		; NETWORK SLICE 2 -> mMTC (SERVICE FUNCTION CHAIN)	
		(next-vnf amf0-2 smf0-2)
		(next-vnf smf0-2 upf0-2)
		; vnfs mappings
		(vnf-mapped-to amf0-2 n2)
		(vnf-mapped-to smf0-2 n2)
		(vnf-mapped-to upf0-2 n1)
		;links mappings
		(link-mapped-to amf0-smf0-2 inner-path-n2)
		(link-mapped-to smf0-upf0-2 n1-n2)

		; NETWORK SLICE 3 -> eMBB (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-3 smf0-3)
		(next-vnf smf0-3 upf0-3)
		; vnfs mappings
		(vnf-mapped-to amf0-3 n2)
		(vnf-mapped-to smf0-3 n3)
		(vnf-mapped-to upf0-3 n3)
		;links mappings
		(link-mapped-to amf0-smf0-3 n2-n3)
		(link-mapped-to smf0-upf0-3 inner-path-n3)

		; NETWORK SLICE 4 -> mMTC (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-4 smf0-4)
		(next-vnf smf0-4 upf0-4)
		; vnfs mappings
		(vnf-mapped-to amf0-4 n3)
		(vnf-mapped-to smf0-4 n3)
		(vnf-mapped-to upf0-4 n1)
		;links mappings
		(link-mapped-to amf0-smf0-4 inner-path-n3)
		(link-mapped-to smf0-upf0-4 n1-n3)

		; AVAILABILITY OF RESOURCES IN SUBSTRATE
		(=(embedding-cpu n1) 80)
		(=(embedding-cpu n2) 32)
		(=(embedding-cpu n3) 32)

		(= (embedding-bandwidth n1-n2) 180)
		(= (embedding-bandwidth n1-n3) 140)
		(= (embedding-bandwidth n2-n3) 180)
		(= (embedding-bandwidth inner-path-n1) 40000000)
		(= (embedding-bandwidth inner-path-n2) 40000000)
		(= (embedding-bandwidth inner-path-n3) 40000000)
		)

	(:goal (and
			; CPU	
			;(>(embedding-cpu n2)32)

			; BANDWIDTH			
			(<(embedding-bandwidth n1-n3)140)
		)
	)
)
