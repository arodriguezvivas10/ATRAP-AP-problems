domain: file "../pddl-codes/4n-4s-3v/domain-4n-4s-3v.pddl"
problem: file "../pddl-codes/4n-4s-3v/instance-4n-4s-3v.pddl"
message: " Time Discretisation = 0.1"
message: " Digits for representing the integer part of a real =  5"
message: " Digits for representing the fractional part of a real =  4"
type
	 real_type: real(7,4);
	integer: -1000..1000;

	 TIME_type: real(7,2);

	node1 : Enum {n1};
	node2 : Enum {n2};
	node3 : Enum {n3};
	node4 : Enum {n4};
	path_n1_n2 : Enum {n1_n2};
	path_n1_n3 : Enum {n1_n3};
	path_n2_n4 : Enum {n2_n4};
	path_n3_n4 : Enum {n3_n4};
	c_path_n1_n4 : Enum {n1_n4};
	c_path_n2_n3 : Enum {n2_n3};
	inner_path1 : Enum {inner_path_n1};
	inner_path2 : Enum {inner_path_n2};
	inner_path3 : Enum {inner_path_n3};
	inner_path4 : Enum {inner_path_n4};
	amf0_ns1 : Enum {amf0_1};
	smf0_ns1 : Enum {smf0_1};
	upf0_ns1 : Enum {upf0_1};
	link_amf0_smf0_ns1 : Enum {amf0_smf0_1};
	link_smf0_upf0_ns1 : Enum {smf0_upf0_1};
	amf0_ns2 : Enum {amf0_2};
	smf0_ns2 : Enum {smf0_2};
	upf0_ns2 : Enum {upf0_2};
	link_amf0_smf0_ns2 : Enum {amf0_smf0_2};
	link_smf0_upf0_ns2 : Enum {smf0_upf0_2};
	amf0_ns3 : Enum {amf0_3};
	smf0_ns3 : Enum {smf0_3};
	upf0_ns3 : Enum {upf0_3};
	link_amf0_smf0_ns3 : Enum {amf0_smf0_3};
	link_smf0_upf0_ns3 : Enum {smf0_upf0_3};
	amf0_ns4 : Enum {amf0_4};
	smf0_ns4 : Enum {smf0_4};
	upf0_ns4 : Enum {upf0_4};
	link_amf0_smf0_ns4 : Enum {amf0_smf0_4};
	link_smf0_upf0_ns4 : Enum {smf0_upf0_4};

const 
	 T:0.1;

	required_bandwidth_urllc : 20.0000;
	scaling_factor : 5.00000;
	substrate_bandwidth_capacity : 200.000;
	substrate_cpu_capacity : 112.000;
	vnfs_required_cpu : 4.00000;

var 
	all_event_true: boolean;
	 h_n: integer;
	 g_n: integer;
	 f_n: integer;
	 TIME[pddlname:"upmurphi_global_clock";]:TIME_type;
	embedding_bandwidth[pddlname:"embedding-bandwidth";] : Array [path] of  real_type;
	embedding_cpu[pddlname:"embedding-cpu";] : Array [host_node] of  real_type;


	adjacent_nodes_i_j[pddlname: "adjacent-nodes-i-j";] : Array [path] of Array [host_node] of Array [host_node] of  boolean;
	adjacent_nodes_j_i[pddlname: "adjacent-nodes-j-i";] : Array [path] of Array [host_node] of Array [host_node] of  boolean;
	next_vnf[pddlname: "next-vnf";] : Array [vnf] of Array [vnf] of  boolean;
	vnf_mapped_to[pddlname: "vnf-mapped-to";] : Array [vnf] of Array [host_node] of  boolean;
	link_mapped_to[pddlname: "link-mapped-to";] : Array [virtual_link] of Array [path] of  boolean;


-- External function declaration 

externfun ext_assignment(value : real_type) : real_type;
externfun decrease_embedding_cpu_action_migrate_amf0_ns1(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type "../pddl-codes/4n-4s-3v/domain-4n-4s-3v.h" ;
externfun increase_embedding_cpu_action_migrate_amf0_ns1(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_amf0_ns1(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_amf0_ns1(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_smf0_ns1(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_smf0_ns1(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_smf0_ns1(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_smf0_ns1(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_upf0_ns1(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_upf0_ns1(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_upf0_ns1(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_upf0_ns1(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_amf0_ns2(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_amf0_ns2(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_amf0_ns2(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_amf0_ns2(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_smf0_ns2(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_smf0_ns2(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_smf0_ns2(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_smf0_ns2(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_upf0_ns2(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_upf0_ns2(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_upf0_ns2(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_upf0_ns2(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_amf0_ns3(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_amf0_ns3(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_amf0_ns3(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_amf0_ns3(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_smf0_ns3(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_smf0_ns3(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_smf0_ns3(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_smf0_ns3(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_upf0_ns3(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_upf0_ns3(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_upf0_ns3(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_upf0_ns3(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_amf0_ns4(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_amf0_ns4(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_amf0_ns4(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_amf0_ns4(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_smf0_ns4(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_smf0_ns4(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_smf0_ns4(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_smf0_ns4(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun decrease_embedding_cpu_action_migrate_upf0_ns4(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun increase_embedding_cpu_action_migrate_upf0_ns4(embedding_cpu : real_type ; scaling_factor : real_type ; vnfs_required_cpu : real_type ; ): real_type ;
externfun decrease_embedding_bandwidth_action_migrate_upf0_ns4(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
externfun increase_embedding_bandwidth_action_migrate_upf0_ns4(embedding_bandwidth : real_type ; required_bandwidth_urllc : real_type ; ): real_type ;
procedure set_adjacent_nodes_i_j( path : path ; node_i : host_node ; node_j : host_node ;  value : boolean);
BEGIN
	adjacent_nodes_i_j[path][node_i][node_j] := value;
END;

function get_adjacent_nodes_i_j( path : path ; node_i : host_node ; node_j : host_node): boolean;
BEGIN
	return 	adjacent_nodes_i_j[path][node_i][node_j];
END;

procedure set_adjacent_nodes_j_i( path : path ; node_j : host_node ; node_i : host_node ;  value : boolean);
BEGIN
	adjacent_nodes_j_i[path][node_j][node_i] := value;
END;

function get_adjacent_nodes_j_i( path : path ; node_j : host_node ; node_i : host_node): boolean;
BEGIN
	return 	adjacent_nodes_j_i[path][node_j][node_i];
END;

procedure set_next_vnf( vnf_to_migrate : vnf ; next_vnf : vnf ;  value : boolean);
BEGIN
	next_vnf[vnf_to_migrate][next_vnf] := value;
END;

function get_next_vnf( vnf_to_migrate : vnf ; next_vnf : vnf): boolean;
BEGIN
	return 	next_vnf[vnf_to_migrate][next_vnf];
END;

procedure set_vnf_mapped_to( vnf : vnf ; h_node : host_node ;  value : boolean);
BEGIN
	vnf_mapped_to[vnf][h_node] := value;
END;

function get_vnf_mapped_to( vnf : vnf ; h_node : host_node): boolean;
BEGIN
	return 	vnf_mapped_to[vnf][h_node];
END;

procedure set_link_mapped_to( virtual_link : virtual_link ; p_path : path ;  value : boolean);
BEGIN
	link_mapped_to[virtual_link][p_path] := value;
END;

function get_link_mapped_to( virtual_link : virtual_link ; p_path : path): boolean;
BEGIN
	return 	link_mapped_to[virtual_link][p_path];
END;










procedure event_check();
 var -- local vars declaration 
   event_triggered : boolean;
BEGIN
 event_triggered := true;
while (event_triggered) do 
 event_triggered := false;
END; -- close while loop 
END;



 function DAs_violate_duration() : boolean ; 
 var -- local vars declaration 
 DA_duration_violated : boolean;
 BEGIN
 DA_duration_violated := false;

 return DA_duration_violated; 
 END; -- close begin


 function DAs_ongoing_in_goal_state() : boolean ; 
 var -- local vars declaration 
 DA_still_ongoing : boolean;
 BEGIN
 DA_still_ongoing := false;

 return DA_still_ongoing; 
 END; -- close begin


procedure apply_continuous_change();
 var -- local vars declaration 
   process_updated : boolean;
 end_while : boolean;BEGIN
 process_updated := false; end_while := false;
while (!end_while) do 
 IF (!process_updated) then
	 end_while:=true;
 else process_updated:=false;
endif;END; -- close while loop 
END;

ruleset vnf_to_migrate:amf0_ns1 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset next_vnf:smf0_ns1 do 
 ruleset smf0_ns1_node:host_node do 
 ruleset link_to_migrate:link_amf0_smf0_ns1 do 
 ruleset from_path:path do 
 ruleset to_path:path do 
 action rule " migrate_amf0_ns1 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link_to_migrate][from_path]) & (!(=[from_path][to_path])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][smf0_ns1_node]) & (adjacent_nodes_i_j[to_path][smf0_ns1_node][to_node]) & (adjacent_nodes_j_i[to_path][to_node][smf0_ns1_node]) & ((( (embedding_bandwidth[to_path]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-amf0-ns1"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link_to_migrate][to_path]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link_to_migrate][from_path]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_amf0_ns1(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_amf0_ns1(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path] := decrease_embedding_bandwidth_action_migrate_amf0_ns1(embedding_bandwidth[to_path] , required_bandwidth_urllc  );
embedding_bandwidth[from_path] := increase_embedding_bandwidth_action_migrate_amf0_ns1(embedding_bandwidth[from_path] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:smf0_ns1 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:amf0_ns1 do 
 ruleset amf0_ns1_node:host_node do 
 ruleset link1_to_migrate:link_amf0_smf0_ns1 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 ruleset next_vnf:upf0_ns1 do 
 ruleset upf0_ns1_node:host_node do 
 ruleset link2_to_migrate:link_smf0_upf0_ns1 do 
 ruleset from_path2:path do 
 ruleset to_path2:path do 
 action rule " migrate_smf0_ns1 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][amf0_ns1_node]) & (adjacent_nodes_i_j[to_path1][amf0_ns1_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][amf0_ns1_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) & (link_mapped_to[link2_to_migrate][from_path2]) & (!(=[from_path2][to_path2])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][upf0_ns1_node]) & (adjacent_nodes_i_j[to_path2][upf0_ns1_node][to_node]) & (adjacent_nodes_j_i[to_path2][to_node][upf0_ns1_node]) & ((( (embedding_bandwidth[to_path2]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-smf0-ns1"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
link_mapped_to[link2_to_migrate][to_path2]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
link_mapped_to[link2_to_migrate][from_path2]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_smf0_ns1(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_smf0_ns1(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_smf0_ns1(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_smf0_ns1(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );
embedding_bandwidth[to_path2] := decrease_embedding_bandwidth_action_migrate_smf0_ns1(embedding_bandwidth[to_path2] , required_bandwidth_urllc  );
embedding_bandwidth[from_path2] := increase_embedding_bandwidth_action_migrate_smf0_ns1(embedding_bandwidth[from_path2] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:upf0_ns1 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:smf0_ns1 do 
 ruleset smf0_ns1_node:host_node do 
 ruleset link1_to_migrate:link_smf0_upf0_ns1 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 action rule " migrate_upf0_ns1 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][smf0_ns1_node]) & (adjacent_nodes_i_j[to_path1][smf0_ns1_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][smf0_ns1_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-upf0-ns1"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_upf0_ns1(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_upf0_ns1(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_upf0_ns1(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_upf0_ns1(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:amf0_ns2 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset next_vnf:smf0_ns2 do 
 ruleset smf0_ns2_node:host_node do 
 ruleset link_to_migrate:link_amf0_smf0_ns2 do 
 ruleset from_path:path do 
 ruleset to_path:path do 
 action rule " migrate_amf0_ns2 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link_to_migrate][from_path]) & (!(=[from_path][to_path])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][smf0_ns2_node]) & (adjacent_nodes_i_j[to_path][smf0_ns2_node][to_node]) & (adjacent_nodes_j_i[to_path][to_node][smf0_ns2_node]) & ((( (embedding_bandwidth[to_path]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-amf0-ns2"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link_to_migrate][to_path]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link_to_migrate][from_path]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_amf0_ns2(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_amf0_ns2(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path] := decrease_embedding_bandwidth_action_migrate_amf0_ns2(embedding_bandwidth[to_path] , required_bandwidth_urllc  );
embedding_bandwidth[from_path] := increase_embedding_bandwidth_action_migrate_amf0_ns2(embedding_bandwidth[from_path] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:smf0_ns2 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:amf0_ns2 do 
 ruleset amf0_ns2_node:host_node do 
 ruleset link1_to_migrate:link_amf0_smf0_ns2 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 ruleset next_vnf:upf0_ns2 do 
 ruleset upf0_ns2_node:host_node do 
 ruleset link2_to_migrate:link_smf0_upf0_ns2 do 
 ruleset from_path2:path do 
 ruleset to_path2:path do 
 action rule " migrate_smf0_ns2 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][amf0_ns2_node]) & (adjacent_nodes_i_j[to_path1][amf0_ns2_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][amf0_ns2_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) & (link_mapped_to[link2_to_migrate][from_path2]) & (!(=[from_path2][to_path2])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][upf0_ns2_node]) & (adjacent_nodes_i_j[to_path2][upf0_ns2_node][to_node]) & (adjacent_nodes_j_i[to_path2][to_node][upf0_ns2_node]) & ((( (embedding_bandwidth[to_path2]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-smf0-ns2"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
link_mapped_to[link2_to_migrate][to_path2]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
link_mapped_to[link2_to_migrate][from_path2]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_smf0_ns2(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_smf0_ns2(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_smf0_ns2(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_smf0_ns2(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );
embedding_bandwidth[to_path2] := decrease_embedding_bandwidth_action_migrate_smf0_ns2(embedding_bandwidth[to_path2] , required_bandwidth_urllc  );
embedding_bandwidth[from_path2] := increase_embedding_bandwidth_action_migrate_smf0_ns2(embedding_bandwidth[from_path2] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:upf0_ns2 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:smf0_ns2 do 
 ruleset smf0_ns2_node:host_node do 
 ruleset link1_to_migrate:link_smf0_upf0_ns2 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 action rule " migrate_upf0_ns2 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][smf0_ns2_node]) & (adjacent_nodes_i_j[to_path1][smf0_ns2_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][smf0_ns2_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-upf0-ns2"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_upf0_ns2(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_upf0_ns2(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_upf0_ns2(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_upf0_ns2(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:amf0_ns3 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset next_vnf:smf0_ns3 do 
 ruleset smf0_ns3_node:host_node do 
 ruleset link_to_migrate:link_amf0_smf0_ns3 do 
 ruleset from_path:path do 
 ruleset to_path:path do 
 action rule " migrate_amf0_ns3 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link_to_migrate][from_path]) & (!(=[from_path][to_path])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][smf0_ns3_node]) & (adjacent_nodes_i_j[to_path][smf0_ns3_node][to_node]) & (adjacent_nodes_j_i[to_path][to_node][smf0_ns3_node]) & ((( (embedding_bandwidth[to_path]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-amf0-ns3"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link_to_migrate][to_path]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link_to_migrate][from_path]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_amf0_ns3(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_amf0_ns3(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path] := decrease_embedding_bandwidth_action_migrate_amf0_ns3(embedding_bandwidth[to_path] , required_bandwidth_urllc  );
embedding_bandwidth[from_path] := increase_embedding_bandwidth_action_migrate_amf0_ns3(embedding_bandwidth[from_path] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:smf0_ns3 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:amf0_ns3 do 
 ruleset amf0_ns3_node:host_node do 
 ruleset link1_to_migrate:link_amf0_smf0_ns3 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 ruleset next_vnf:upf0_ns3 do 
 ruleset upf0_ns3_node:host_node do 
 ruleset link2_to_migrate:link_smf0_upf0_ns3 do 
 ruleset from_path2:path do 
 ruleset to_path2:path do 
 action rule " migrate_smf0_ns3 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][amf0_ns3_node]) & (adjacent_nodes_i_j[to_path1][amf0_ns3_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][amf0_ns3_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) & (link_mapped_to[link2_to_migrate][from_path2]) & (!(=[from_path2][to_path2])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][upf0_ns3_node]) & (adjacent_nodes_i_j[to_path2][upf0_ns3_node][to_node]) & (adjacent_nodes_j_i[to_path2][to_node][upf0_ns3_node]) & ((( (embedding_bandwidth[to_path2]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-smf0-ns3"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
link_mapped_to[link2_to_migrate][to_path2]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
link_mapped_to[link2_to_migrate][from_path2]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_smf0_ns3(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_smf0_ns3(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_smf0_ns3(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_smf0_ns3(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );
embedding_bandwidth[to_path2] := decrease_embedding_bandwidth_action_migrate_smf0_ns3(embedding_bandwidth[to_path2] , required_bandwidth_urllc  );
embedding_bandwidth[from_path2] := increase_embedding_bandwidth_action_migrate_smf0_ns3(embedding_bandwidth[from_path2] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:upf0_ns3 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:smf0_ns3 do 
 ruleset smf0_ns3_node:host_node do 
 ruleset link1_to_migrate:link_smf0_upf0_ns3 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 action rule " migrate_upf0_ns3 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][smf0_ns3_node]) & (adjacent_nodes_i_j[to_path1][smf0_ns3_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][smf0_ns3_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-upf0-ns3"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_upf0_ns3(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_upf0_ns3(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_upf0_ns3(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_upf0_ns3(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:amf0_ns4 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset next_vnf:smf0_ns4 do 
 ruleset smf0_ns4_node:host_node do 
 ruleset link_to_migrate:link_amf0_smf0_ns4 do 
 ruleset from_path:path do 
 ruleset to_path:path do 
 action rule " migrate_amf0_ns4 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link_to_migrate][from_path]) & (!(=[from_path][to_path])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][smf0_ns4_node]) & (adjacent_nodes_i_j[to_path][smf0_ns4_node][to_node]) & (adjacent_nodes_j_i[to_path][to_node][smf0_ns4_node]) & ((( (embedding_bandwidth[to_path]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-amf0-ns4"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link_to_migrate][to_path]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link_to_migrate][from_path]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_amf0_ns4(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_amf0_ns4(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path] := decrease_embedding_bandwidth_action_migrate_amf0_ns4(embedding_bandwidth[to_path] , required_bandwidth_urllc  );
embedding_bandwidth[from_path] := increase_embedding_bandwidth_action_migrate_amf0_ns4(embedding_bandwidth[from_path] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:smf0_ns4 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:amf0_ns4 do 
 ruleset amf0_ns4_node:host_node do 
 ruleset link1_to_migrate:link_amf0_smf0_ns4 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 ruleset next_vnf:upf0_ns4 do 
 ruleset upf0_ns4_node:host_node do 
 ruleset link2_to_migrate:link_smf0_upf0_ns4 do 
 ruleset from_path2:path do 
 ruleset to_path2:path do 
 action rule " migrate_smf0_ns4 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][amf0_ns4_node]) & (adjacent_nodes_i_j[to_path1][amf0_ns4_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][amf0_ns4_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) & (link_mapped_to[link2_to_migrate][from_path2]) & (!(=[from_path2][to_path2])) & (next_vnf[vnf_to_migrate][next_vnf]) & (vnf_mapped_to[next_vnf][upf0_ns4_node]) & (adjacent_nodes_i_j[to_path2][upf0_ns4_node][to_node]) & (adjacent_nodes_j_i[to_path2][to_node][upf0_ns4_node]) & ((( (embedding_bandwidth[to_path2]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-smf0-ns4"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
link_mapped_to[link2_to_migrate][to_path2]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
link_mapped_to[link2_to_migrate][from_path2]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_smf0_ns4(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_smf0_ns4(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_smf0_ns4(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_smf0_ns4(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );
embedding_bandwidth[to_path2] := decrease_embedding_bandwidth_action_migrate_smf0_ns4(embedding_bandwidth[to_path2] , required_bandwidth_urllc  );
embedding_bandwidth[from_path2] := increase_embedding_bandwidth_action_migrate_smf0_ns4(embedding_bandwidth[from_path2] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

ruleset vnf_to_migrate:upf0_ns4 do 
 ruleset from_node:host_node do 
 ruleset to_node:host_node do 
 ruleset prev_vnf:smf0_ns4 do 
 ruleset smf0_ns4_node:host_node do 
 ruleset link1_to_migrate:link_smf0_upf0_ns4 do 
 ruleset from_path1:path do 
 ruleset to_path1:path do 
 action rule " migrate_upf0_ns4 " 
(vnf_mapped_to[vnf_to_migrate][from_node]) & (!(=[from_node][to_node])) & ((( (embedding_cpu[to_node]) / ((scaling_factor) * (vnfs_required_cpu))) >= (1.00000))) & (link_mapped_to[link1_to_migrate][from_path1]) & (!(=[from_path1][to_path1])) & (next_vnf[prev_vnf][vnf_to_migrate]) & (vnf_mapped_to[prev_vnf][smf0_ns4_node]) & (adjacent_nodes_i_j[to_path1][smf0_ns4_node][to_node]) & (adjacent_nodes_j_i[to_path1][to_node][smf0_ns4_node]) & ((( (embedding_bandwidth[to_path1]) / (required_bandwidth_urllc)) >= (1.00000))) ==> 
pddlname: " migrate-upf0-ns4"; 
BEGIN
vnf_mapped_to[vnf_to_migrate][to_node]:= true; 
link_mapped_to[link1_to_migrate][to_path1]:= true; 
vnf_mapped_to[vnf_to_migrate][from_node]:= false; 
link_mapped_to[link1_to_migrate][from_path1]:= false; 
embedding_cpu[to_node] := decrease_embedding_cpu_action_migrate_upf0_ns4(embedding_cpu[to_node] , scaling_factor , vnfs_required_cpu  );
embedding_cpu[from_node] := increase_embedding_cpu_action_migrate_upf0_ns4(embedding_cpu[from_node] , scaling_factor , vnfs_required_cpu  );
embedding_bandwidth[to_path1] := decrease_embedding_bandwidth_action_migrate_upf0_ns4(embedding_bandwidth[to_path1] , required_bandwidth_urllc  );
embedding_bandwidth[from_path1] := increase_embedding_bandwidth_action_migrate_upf0_ns4(embedding_bandwidth[from_path1] , required_bandwidth_urllc  );

END; 
END; 
END; 
END; 
END; 
END; 
END; 
END; 
END;

clock rule " time passing " 
 (true) ==> 
BEGIN 
 	TIME := TIME + T;

 	 event_check();
	 apply_continuous_change();
	 event_check();
END;


startstate "start" 
BEGIN 
TIME := 0.0;
for path : path do 
  for node_i : host_node do 
    for node_j : host_node do 
      set_adjacent_nodes_i_j(path,node_i,node_j, false);
END; END; END;  -- close for
   for path : path do 
     for node_j : host_node do 
       for node_i : host_node do 
         set_adjacent_nodes_j_i(path,node_j,node_i, false);
END; END; END;  -- close for
   for vnf_to_migrate : vnf do 
     for next_vnf : vnf do 
       set_next_vnf(vnf_to_migrate,next_vnf, false);
END; END;  -- close for
   for vnf : vnf do 
     for h_node : host_node do 
       set_vnf_mapped_to(vnf,h_node, false);
END; END;  -- close for
   for virtual_link : virtual_link do 
     for p_path : path do 
       set_link_mapped_to(virtual_link,p_path, false);
END; END;  -- close for





   for h_node : host_node do 
     embedding_cpu[h_node] := 0.0 ;
END;  -- close for
   for p_path : path do 
     embedding_bandwidth[p_path] := 0.0 ;
END;  -- close for
adjacent_nodes_i_j[n1_n2][n1][n2]:= true; 
adjacent_nodes_j_i[n1_n2][n2][n1]:= true; 
adjacent_nodes_i_j[n1_n3][n1][n3]:= true; 
adjacent_nodes_j_i[n1_n3][n3][n1]:= true; 
adjacent_nodes_i_j[n2_n3][n2][n3]:= true; 
adjacent_nodes_j_i[n2_n3][n3][n2]:= true; 
adjacent_nodes_i_j[n1_n4][n1][n4]:= true; 
adjacent_nodes_j_i[n1_n4][n4][n1]:= true; 
adjacent_nodes_i_j[n2_n3][n2][n3]:= true; 
adjacent_nodes_j_i[n2_n3][n3][n2]:= true; 
adjacent_nodes_i_j[inner_path_n1][n1][n1]:= true; 
adjacent_nodes_j_i[inner_path_n1][n1][n1]:= true; 
adjacent_nodes_i_j[inner_path_n2][n2][n2]:= true; 
adjacent_nodes_j_i[inner_path_n2][n2][n2]:= true; 
adjacent_nodes_i_j[inner_path_n3][n3][n3]:= true; 
adjacent_nodes_j_i[inner_path_n3][n3][n3]:= true; 
adjacent_nodes_i_j[inner_path_n4][n4][n4]:= true; 
adjacent_nodes_j_i[inner_path_n4][n4][n4]:= true; 
next_vnf[amf0_1][smf0_1]:= true; 
next_vnf[smf0_1][upf0_1]:= true; 
vnf_mapped_to[amf0_1][n2]:= true; 
vnf_mapped_to[smf0_1][n4]:= true; 
vnf_mapped_to[upf0_1][n2]:= true; 
link_mapped_to[amf0_smf0_1][n2_n4]:= true; 
link_mapped_to[smf0_upf0_1][n2_n4]:= true; 
next_vnf[amf0_2][smf0_2]:= true; 
next_vnf[smf0_2][upf0_2]:= true; 
vnf_mapped_to[amf0_2][n2]:= true; 
vnf_mapped_to[smf0_2][n2]:= true; 
vnf_mapped_to[upf0_2][n1]:= true; 
link_mapped_to[amf0_smf0_2][inner_path_n2]:= true; 
link_mapped_to[smf0_upf0_2][n1_n2]:= true; 
next_vnf[amf0_3][smf0_3]:= true; 
next_vnf[smf0_3][upf0_3]:= true; 
vnf_mapped_to[amf0_3][n4]:= true; 
vnf_mapped_to[smf0_3][n3]:= true; 
vnf_mapped_to[upf0_3][n3]:= true; 
link_mapped_to[amf0_smf0_3][n3_n4]:= true; 
link_mapped_to[smf0_upf0_3][inner_path_n3]:= true; 
next_vnf[amf0_4][smf0_4]:= true; 
next_vnf[smf0_4][upf0_4]:= true; 
vnf_mapped_to[amf0_4][n4]:= true; 
vnf_mapped_to[smf0_4][n4]:= true; 
vnf_mapped_to[upf0_4][n1]:= true; 
link_mapped_to[amf0_smf0_4][inner_path_n4]:= true; 
link_mapped_to[smf0_upf0_4][n1_n4]:= true; 
embedding_cpu[n1] := 72.0000;
embedding_cpu[n2] := 32.0000;
embedding_cpu[n3] := 72.0000;
embedding_cpu[n4] := 32.0000;
embedding_bandwidth[n1_n2] := 180.000;
embedding_bandwidth[n1_n3] := 200.000;
embedding_bandwidth[n2_n4] := 160.000;
embedding_bandwidth[n3_n4] := 180.000;
embedding_bandwidth[n1_n4] := 180.000;
embedding_bandwidth[n2_n3] := 200.000;
embedding_bandwidth[inner_path_n1] := 4.00000E+07;
embedding_bandwidth[inner_path_n2] := 4.00000E+07;
embedding_bandwidth[inner_path_n3] := 4.00000E+07;
embedding_bandwidth[inner_path_n4] := 4.00000E+07;
all_event_true := true;
g_n := 0;
h_n := 0;
f_n := 0;
END; -- close startstate

goal "enjoy" 
 ((( embedding_cpu[n1]) = (embedding_cpu[n2]))) & ((( embedding_cpu[n3]) = (embedding_cpu[n4])))& !DAs_ongoing_in_goal_state(); 

invariant "todo bien" 
 all_event_true & !DAs_violate_duration();
metric: minimize;


