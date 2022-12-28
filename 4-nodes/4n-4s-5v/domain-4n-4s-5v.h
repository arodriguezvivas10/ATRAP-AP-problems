#include <cmath>
#include <iostream>
#include <stdlib.h>
#include <stdio.h>

double round_k_digits(double n, unsigned k){
	double prec = pow(0.1,k);
	double round = (n>0) ? (n+prec/2) : (n-prec/2);
	return round-fmod(round,prec);
}

double ext_assignment(double n){
	return round_k_digits(n,2);
}

double decrease_embedding_cpu_action_migrate_amf0_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf0_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf0_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf0_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_upf0_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_upf0_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_amf1_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf1_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf1_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf1_ns1(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf1_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf1_ns1(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_amf0_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf0_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf0_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf0_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_upf0_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_upf0_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_amf1_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf1_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf1_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf1_ns2(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf1_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf1_ns2(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_amf0_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf0_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf0_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf0_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_upf0_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_upf0_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_amf1_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf1_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf1_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf1_ns3(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf1_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf1_ns3(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_amf0_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf0_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf0_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf0_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_upf0_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_upf0_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_upf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_upf0_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_amf1_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_amf1_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_bandwidth_action_migrate_amf1_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_amf1_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

double decrease_embedding_cpu_action_migrate_smf1_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu-((scaling_factor) * (vnfs_required_cpu)),2); 
}

double increase_embedding_cpu_action_migrate_smf1_ns4(double embedding_cpu, double scaling_factor, double vnfs_required_cpu ) {
	 return round_k_digits(embedding_cpu+((scaling_factor) * (vnfs_required_cpu)),2); 
}

double decrease_embedding_bandwidth_action_migrate_smf1_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth-(required_bandwidth_urllc),2); 
}

double increase_embedding_bandwidth_action_migrate_smf1_ns4(double embedding_bandwidth, double required_bandwidth_urllc ) {
	 return round_k_digits(embedding_bandwidth+(required_bandwidth_urllc),2); 
}

