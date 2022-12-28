/******************************
  Program "../pddl-codes/4n-4s-5v/domain-4n-4s-5v.m" compiled by "DiNo Release 1.1"

  DiNo Last Compiled date: "Sep 19 2022"
 ******************************/

/********************
  Parameter
 ********************/
#define DINO_VERSION "DiNo Release 1.1"
#define MURPHI_DATE "Sep 19 2022"
#define PROTOCOL_NAME "../pddl-codes/4n-4s-5v/domain-4n-4s-5v"
#define DOMAIN_FILENAME "../pddl-codes/4n-4s-5v/domain-4n-4s-5v.pddl"
#define PROBLEM_FILENAME "../pddl-codes/4n-4s-5v/instance-4n-4s-5v.pddl"
#define DISCRETIZATION 0.100000
#define VAL_PATHNAME "/home/angela/phd-prototype/DiNo/src/DiNo/../VAL-master/validate"
#define BITS_IN_WORLD 0
#define HASHC
const char * const modelmessages[] = { " Time Discretisation = 0.1"," Digits for representing the integer part of a real =  5"," Digits for representing the fractional part of a real =  4" };
const int modelmessagecount = 3;

/********************
  Include
 ********************/
#include "upm_prolog.hpp"

/********************
  Decl declaration
 ********************/

class mu_1_real_type: public mu__real
{
 public:
  inline double operator=(double val) { return mu__real::operator=(val); };
  inline double operator=(const mu_1_real_type& val) { return mu__real::operator=((double) val); };
  mu_1_real_type (const char *name, int os): mu__real(7,4,40,name, os) {};
  mu_1_real_type (void): mu__real(7,4,40) {};
  mu_1_real_type (double val): mu__real(7,4,40,"Parameter or function result.", 0)
  {
    operator=(val);
  };
  char * Name() { return tsprintf("%le",value()); };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
};

/*** end of real decl ***/
mu_1_real_type mu_1_real_type_undefined_var;

class mu_1_integer: public mu__long
{
 public:
  inline int operator=(int val) { return mu__long::operator=(val); };
  inline int operator=(const mu_1_integer& val) { return mu__long::operator=((int) val); };
  mu_1_integer (const char *name, int os): mu__long(-1000, 1000, 11, name, os) {};
  mu_1_integer (void): mu__long(-1000, 1000, 11) {};
  mu_1_integer (int val): mu__long(-1000, 1000, 11, "Parameter or function result.", 0)
  {
    operator=(val);
  };
  char * Name() { return tsprintf("%d",value()); };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
};

/*** end of subrange decl ***/
mu_1_integer mu_1_integer_undefined_var;

class mu_1_TIME_type: public mu__real
{
 public:
  inline double operator=(double val) { return mu__real::operator=(val); };
  inline double operator=(const mu_1_TIME_type& val) { return mu__real::operator=((double) val); };
  mu_1_TIME_type (const char *name, int os): mu__real(7,2,40,name, os) {};
  mu_1_TIME_type (void): mu__real(7,2,40) {};
  mu_1_TIME_type (double val): mu__real(7,2,40,"Parameter or function result.", 0)
  {
    operator=(val);
  };
  char * Name() { return tsprintf("%le",value()); };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
};

/*** end of real decl ***/
mu_1_TIME_type mu_1_TIME_type_undefined_var;

class mu_1_node1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_node1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_node1& val)
  {
    if (val.defined())
      return ( s << mu_1_node1::values[ int(val) - 1] );
    else return ( s << "Undefined" );
  };

  mu_1_node1 (const char *name, int os): mu__byte(1, 1, 1, name, os) {};
  mu_1_node1 (void): mu__byte(1, 1, 1) {};
  mu_1_node1 (int val): mu__byte(1, 1, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -1]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -1],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_node1::values[] = {"n1",NULL };

/*** end of enum declaration ***/
mu_1_node1 mu_1_node1_undefined_var;

class mu_1_node2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_node2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_node2& val)
  {
    if (val.defined())
      return ( s << mu_1_node2::values[ int(val) - 2] );
    else return ( s << "Undefined" );
  };

  mu_1_node2 (const char *name, int os): mu__byte(2, 2, 1, name, os) {};
  mu_1_node2 (void): mu__byte(2, 2, 1) {};
  mu_1_node2 (int val): mu__byte(2, 2, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -2]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -2],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_node2::values[] = {"n2",NULL };

/*** end of enum declaration ***/
mu_1_node2 mu_1_node2_undefined_var;

class mu_1_node3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_node3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_node3& val)
  {
    if (val.defined())
      return ( s << mu_1_node3::values[ int(val) - 3] );
    else return ( s << "Undefined" );
  };

  mu_1_node3 (const char *name, int os): mu__byte(3, 3, 1, name, os) {};
  mu_1_node3 (void): mu__byte(3, 3, 1) {};
  mu_1_node3 (int val): mu__byte(3, 3, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -3]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -3],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_node3::values[] = {"n3",NULL };

/*** end of enum declaration ***/
mu_1_node3 mu_1_node3_undefined_var;

class mu_1_node4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_node4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_node4& val)
  {
    if (val.defined())
      return ( s << mu_1_node4::values[ int(val) - 4] );
    else return ( s << "Undefined" );
  };

  mu_1_node4 (const char *name, int os): mu__byte(4, 4, 1, name, os) {};
  mu_1_node4 (void): mu__byte(4, 4, 1) {};
  mu_1_node4 (int val): mu__byte(4, 4, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -4]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -4],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_node4::values[] = {"n4",NULL };

/*** end of enum declaration ***/
mu_1_node4 mu_1_node4_undefined_var;

class mu_1_path_n1_n2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_path_n1_n2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_path_n1_n2& val)
  {
    if (val.defined())
      return ( s << mu_1_path_n1_n2::values[ int(val) - 5] );
    else return ( s << "Undefined" );
  };

  mu_1_path_n1_n2 (const char *name, int os): mu__byte(5, 5, 1, name, os) {};
  mu_1_path_n1_n2 (void): mu__byte(5, 5, 1) {};
  mu_1_path_n1_n2 (int val): mu__byte(5, 5, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -5]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -5],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_path_n1_n2::values[] = {"n1_n2",NULL };

/*** end of enum declaration ***/
mu_1_path_n1_n2 mu_1_path_n1_n2_undefined_var;

class mu_1_path_n1_n3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_path_n1_n3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_path_n1_n3& val)
  {
    if (val.defined())
      return ( s << mu_1_path_n1_n3::values[ int(val) - 6] );
    else return ( s << "Undefined" );
  };

  mu_1_path_n1_n3 (const char *name, int os): mu__byte(6, 6, 1, name, os) {};
  mu_1_path_n1_n3 (void): mu__byte(6, 6, 1) {};
  mu_1_path_n1_n3 (int val): mu__byte(6, 6, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -6]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -6],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_path_n1_n3::values[] = {"n1_n3",NULL };

/*** end of enum declaration ***/
mu_1_path_n1_n3 mu_1_path_n1_n3_undefined_var;

class mu_1_path_n2_n4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_path_n2_n4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_path_n2_n4& val)
  {
    if (val.defined())
      return ( s << mu_1_path_n2_n4::values[ int(val) - 7] );
    else return ( s << "Undefined" );
  };

  mu_1_path_n2_n4 (const char *name, int os): mu__byte(7, 7, 1, name, os) {};
  mu_1_path_n2_n4 (void): mu__byte(7, 7, 1) {};
  mu_1_path_n2_n4 (int val): mu__byte(7, 7, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -7]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -7],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_path_n2_n4::values[] = {"n2_n4",NULL };

/*** end of enum declaration ***/
mu_1_path_n2_n4 mu_1_path_n2_n4_undefined_var;

class mu_1_path_n3_n4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_path_n3_n4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_path_n3_n4& val)
  {
    if (val.defined())
      return ( s << mu_1_path_n3_n4::values[ int(val) - 8] );
    else return ( s << "Undefined" );
  };

  mu_1_path_n3_n4 (const char *name, int os): mu__byte(8, 8, 1, name, os) {};
  mu_1_path_n3_n4 (void): mu__byte(8, 8, 1) {};
  mu_1_path_n3_n4 (int val): mu__byte(8, 8, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -8]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -8],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_path_n3_n4::values[] = {"n3_n4",NULL };

/*** end of enum declaration ***/
mu_1_path_n3_n4 mu_1_path_n3_n4_undefined_var;

class mu_1_c_path_n1_n4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_c_path_n1_n4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_c_path_n1_n4& val)
  {
    if (val.defined())
      return ( s << mu_1_c_path_n1_n4::values[ int(val) - 9] );
    else return ( s << "Undefined" );
  };

  mu_1_c_path_n1_n4 (const char *name, int os): mu__byte(9, 9, 1, name, os) {};
  mu_1_c_path_n1_n4 (void): mu__byte(9, 9, 1) {};
  mu_1_c_path_n1_n4 (int val): mu__byte(9, 9, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -9]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -9],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_c_path_n1_n4::values[] = {"n1_n4",NULL };

/*** end of enum declaration ***/
mu_1_c_path_n1_n4 mu_1_c_path_n1_n4_undefined_var;

class mu_1_c_path_n2_n3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_c_path_n2_n3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_c_path_n2_n3& val)
  {
    if (val.defined())
      return ( s << mu_1_c_path_n2_n3::values[ int(val) - 10] );
    else return ( s << "Undefined" );
  };

  mu_1_c_path_n2_n3 (const char *name, int os): mu__byte(10, 10, 1, name, os) {};
  mu_1_c_path_n2_n3 (void): mu__byte(10, 10, 1) {};
  mu_1_c_path_n2_n3 (int val): mu__byte(10, 10, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -10]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -10],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_c_path_n2_n3::values[] = {"n2_n3",NULL };

/*** end of enum declaration ***/
mu_1_c_path_n2_n3 mu_1_c_path_n2_n3_undefined_var;

class mu_1_inner_path1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_inner_path1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_inner_path1& val)
  {
    if (val.defined())
      return ( s << mu_1_inner_path1::values[ int(val) - 11] );
    else return ( s << "Undefined" );
  };

  mu_1_inner_path1 (const char *name, int os): mu__byte(11, 11, 1, name, os) {};
  mu_1_inner_path1 (void): mu__byte(11, 11, 1) {};
  mu_1_inner_path1 (int val): mu__byte(11, 11, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -11]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -11],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_inner_path1::values[] = {"inner_path_n1",NULL };

/*** end of enum declaration ***/
mu_1_inner_path1 mu_1_inner_path1_undefined_var;

class mu_1_inner_path2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_inner_path2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_inner_path2& val)
  {
    if (val.defined())
      return ( s << mu_1_inner_path2::values[ int(val) - 12] );
    else return ( s << "Undefined" );
  };

  mu_1_inner_path2 (const char *name, int os): mu__byte(12, 12, 1, name, os) {};
  mu_1_inner_path2 (void): mu__byte(12, 12, 1) {};
  mu_1_inner_path2 (int val): mu__byte(12, 12, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -12]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -12],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_inner_path2::values[] = {"inner_path_n2",NULL };

/*** end of enum declaration ***/
mu_1_inner_path2 mu_1_inner_path2_undefined_var;

class mu_1_inner_path3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_inner_path3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_inner_path3& val)
  {
    if (val.defined())
      return ( s << mu_1_inner_path3::values[ int(val) - 13] );
    else return ( s << "Undefined" );
  };

  mu_1_inner_path3 (const char *name, int os): mu__byte(13, 13, 1, name, os) {};
  mu_1_inner_path3 (void): mu__byte(13, 13, 1) {};
  mu_1_inner_path3 (int val): mu__byte(13, 13, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -13]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -13],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_inner_path3::values[] = {"inner_path_n3",NULL };

/*** end of enum declaration ***/
mu_1_inner_path3 mu_1_inner_path3_undefined_var;

class mu_1_inner_path4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_inner_path4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_inner_path4& val)
  {
    if (val.defined())
      return ( s << mu_1_inner_path4::values[ int(val) - 14] );
    else return ( s << "Undefined" );
  };

  mu_1_inner_path4 (const char *name, int os): mu__byte(14, 14, 1, name, os) {};
  mu_1_inner_path4 (void): mu__byte(14, 14, 1) {};
  mu_1_inner_path4 (int val): mu__byte(14, 14, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -14]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -14],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_inner_path4::values[] = {"inner_path_n4",NULL };

/*** end of enum declaration ***/
mu_1_inner_path4 mu_1_inner_path4_undefined_var;

class mu_1_amf0_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf0_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf0_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_amf0_ns1::values[ int(val) - 15] );
    else return ( s << "Undefined" );
  };

  mu_1_amf0_ns1 (const char *name, int os): mu__byte(15, 15, 1, name, os) {};
  mu_1_amf0_ns1 (void): mu__byte(15, 15, 1) {};
  mu_1_amf0_ns1 (int val): mu__byte(15, 15, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -15]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -15],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf0_ns1::values[] = {"amf0_1",NULL };

/*** end of enum declaration ***/
mu_1_amf0_ns1 mu_1_amf0_ns1_undefined_var;

class mu_1_smf0_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf0_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf0_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_smf0_ns1::values[ int(val) - 16] );
    else return ( s << "Undefined" );
  };

  mu_1_smf0_ns1 (const char *name, int os): mu__byte(16, 16, 1, name, os) {};
  mu_1_smf0_ns1 (void): mu__byte(16, 16, 1) {};
  mu_1_smf0_ns1 (int val): mu__byte(16, 16, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -16]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -16],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf0_ns1::values[] = {"smf0_1",NULL };

/*** end of enum declaration ***/
mu_1_smf0_ns1 mu_1_smf0_ns1_undefined_var;

class mu_1_upf0_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_upf0_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_upf0_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_upf0_ns1::values[ int(val) - 17] );
    else return ( s << "Undefined" );
  };

  mu_1_upf0_ns1 (const char *name, int os): mu__byte(17, 17, 1, name, os) {};
  mu_1_upf0_ns1 (void): mu__byte(17, 17, 1) {};
  mu_1_upf0_ns1 (int val): mu__byte(17, 17, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -17]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -17],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_upf0_ns1::values[] = {"upf0_1",NULL };

/*** end of enum declaration ***/
mu_1_upf0_ns1 mu_1_upf0_ns1_undefined_var;

class mu_1_amf1_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf1_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf1_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_amf1_ns1::values[ int(val) - 18] );
    else return ( s << "Undefined" );
  };

  mu_1_amf1_ns1 (const char *name, int os): mu__byte(18, 18, 1, name, os) {};
  mu_1_amf1_ns1 (void): mu__byte(18, 18, 1) {};
  mu_1_amf1_ns1 (int val): mu__byte(18, 18, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -18]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -18],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf1_ns1::values[] = {"amf1_1",NULL };

/*** end of enum declaration ***/
mu_1_amf1_ns1 mu_1_amf1_ns1_undefined_var;

class mu_1_smf1_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf1_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf1_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_smf1_ns1::values[ int(val) - 19] );
    else return ( s << "Undefined" );
  };

  mu_1_smf1_ns1 (const char *name, int os): mu__byte(19, 19, 1, name, os) {};
  mu_1_smf1_ns1 (void): mu__byte(19, 19, 1) {};
  mu_1_smf1_ns1 (int val): mu__byte(19, 19, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -19]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -19],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf1_ns1::values[] = {"smf1_1",NULL };

/*** end of enum declaration ***/
mu_1_smf1_ns1 mu_1_smf1_ns1_undefined_var;

class mu_1_link_amf0_smf0_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_amf0_smf0_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_amf0_smf0_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_link_amf0_smf0_ns1::values[ int(val) - 20] );
    else return ( s << "Undefined" );
  };

  mu_1_link_amf0_smf0_ns1 (const char *name, int os): mu__byte(20, 20, 1, name, os) {};
  mu_1_link_amf0_smf0_ns1 (void): mu__byte(20, 20, 1) {};
  mu_1_link_amf0_smf0_ns1 (int val): mu__byte(20, 20, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -20]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -20],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_amf0_smf0_ns1::values[] = {"amf0_smf0_1",NULL };

/*** end of enum declaration ***/
mu_1_link_amf0_smf0_ns1 mu_1_link_amf0_smf0_ns1_undefined_var;

class mu_1_link_smf0_upf0_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_smf0_upf0_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_smf0_upf0_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_link_smf0_upf0_ns1::values[ int(val) - 21] );
    else return ( s << "Undefined" );
  };

  mu_1_link_smf0_upf0_ns1 (const char *name, int os): mu__byte(21, 21, 1, name, os) {};
  mu_1_link_smf0_upf0_ns1 (void): mu__byte(21, 21, 1) {};
  mu_1_link_smf0_upf0_ns1 (int val): mu__byte(21, 21, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -21]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -21],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_smf0_upf0_ns1::values[] = {"smf0_upf0_1",NULL };

/*** end of enum declaration ***/
mu_1_link_smf0_upf0_ns1 mu_1_link_smf0_upf0_ns1_undefined_var;

class mu_1_link_upf0_amf1_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_upf0_amf1_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_upf0_amf1_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_link_upf0_amf1_ns1::values[ int(val) - 22] );
    else return ( s << "Undefined" );
  };

  mu_1_link_upf0_amf1_ns1 (const char *name, int os): mu__byte(22, 22, 1, name, os) {};
  mu_1_link_upf0_amf1_ns1 (void): mu__byte(22, 22, 1) {};
  mu_1_link_upf0_amf1_ns1 (int val): mu__byte(22, 22, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -22]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -22],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_upf0_amf1_ns1::values[] = {"upf0_amf1_1",NULL };

/*** end of enum declaration ***/
mu_1_link_upf0_amf1_ns1 mu_1_link_upf0_amf1_ns1_undefined_var;

class mu_1_link_amf1_smf1_ns1: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_amf1_smf1_ns1& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_amf1_smf1_ns1& val)
  {
    if (val.defined())
      return ( s << mu_1_link_amf1_smf1_ns1::values[ int(val) - 23] );
    else return ( s << "Undefined" );
  };

  mu_1_link_amf1_smf1_ns1 (const char *name, int os): mu__byte(23, 23, 1, name, os) {};
  mu_1_link_amf1_smf1_ns1 (void): mu__byte(23, 23, 1) {};
  mu_1_link_amf1_smf1_ns1 (int val): mu__byte(23, 23, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -23]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -23],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_amf1_smf1_ns1::values[] = {"amf1_smf1_1",NULL };

/*** end of enum declaration ***/
mu_1_link_amf1_smf1_ns1 mu_1_link_amf1_smf1_ns1_undefined_var;

class mu_1_amf0_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf0_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf0_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_amf0_ns2::values[ int(val) - 24] );
    else return ( s << "Undefined" );
  };

  mu_1_amf0_ns2 (const char *name, int os): mu__byte(24, 24, 1, name, os) {};
  mu_1_amf0_ns2 (void): mu__byte(24, 24, 1) {};
  mu_1_amf0_ns2 (int val): mu__byte(24, 24, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -24]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -24],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf0_ns2::values[] = {"amf0_2",NULL };

/*** end of enum declaration ***/
mu_1_amf0_ns2 mu_1_amf0_ns2_undefined_var;

class mu_1_smf0_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf0_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf0_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_smf0_ns2::values[ int(val) - 25] );
    else return ( s << "Undefined" );
  };

  mu_1_smf0_ns2 (const char *name, int os): mu__byte(25, 25, 1, name, os) {};
  mu_1_smf0_ns2 (void): mu__byte(25, 25, 1) {};
  mu_1_smf0_ns2 (int val): mu__byte(25, 25, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -25]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -25],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf0_ns2::values[] = {"smf0_2",NULL };

/*** end of enum declaration ***/
mu_1_smf0_ns2 mu_1_smf0_ns2_undefined_var;

class mu_1_upf0_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_upf0_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_upf0_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_upf0_ns2::values[ int(val) - 26] );
    else return ( s << "Undefined" );
  };

  mu_1_upf0_ns2 (const char *name, int os): mu__byte(26, 26, 1, name, os) {};
  mu_1_upf0_ns2 (void): mu__byte(26, 26, 1) {};
  mu_1_upf0_ns2 (int val): mu__byte(26, 26, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -26]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -26],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_upf0_ns2::values[] = {"upf0_2",NULL };

/*** end of enum declaration ***/
mu_1_upf0_ns2 mu_1_upf0_ns2_undefined_var;

class mu_1_amf1_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf1_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf1_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_amf1_ns2::values[ int(val) - 27] );
    else return ( s << "Undefined" );
  };

  mu_1_amf1_ns2 (const char *name, int os): mu__byte(27, 27, 1, name, os) {};
  mu_1_amf1_ns2 (void): mu__byte(27, 27, 1) {};
  mu_1_amf1_ns2 (int val): mu__byte(27, 27, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -27]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -27],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf1_ns2::values[] = {"amf1_2",NULL };

/*** end of enum declaration ***/
mu_1_amf1_ns2 mu_1_amf1_ns2_undefined_var;

class mu_1_smf1_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf1_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf1_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_smf1_ns2::values[ int(val) - 28] );
    else return ( s << "Undefined" );
  };

  mu_1_smf1_ns2 (const char *name, int os): mu__byte(28, 28, 1, name, os) {};
  mu_1_smf1_ns2 (void): mu__byte(28, 28, 1) {};
  mu_1_smf1_ns2 (int val): mu__byte(28, 28, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -28]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -28],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf1_ns2::values[] = {"smf1_2",NULL };

/*** end of enum declaration ***/
mu_1_smf1_ns2 mu_1_smf1_ns2_undefined_var;

class mu_1_link_amf0_smf0_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_amf0_smf0_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_amf0_smf0_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_link_amf0_smf0_ns2::values[ int(val) - 29] );
    else return ( s << "Undefined" );
  };

  mu_1_link_amf0_smf0_ns2 (const char *name, int os): mu__byte(29, 29, 1, name, os) {};
  mu_1_link_amf0_smf0_ns2 (void): mu__byte(29, 29, 1) {};
  mu_1_link_amf0_smf0_ns2 (int val): mu__byte(29, 29, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -29]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -29],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_amf0_smf0_ns2::values[] = {"amf0_smf0_2",NULL };

/*** end of enum declaration ***/
mu_1_link_amf0_smf0_ns2 mu_1_link_amf0_smf0_ns2_undefined_var;

class mu_1_link_smf0_upf0_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_smf0_upf0_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_smf0_upf0_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_link_smf0_upf0_ns2::values[ int(val) - 30] );
    else return ( s << "Undefined" );
  };

  mu_1_link_smf0_upf0_ns2 (const char *name, int os): mu__byte(30, 30, 1, name, os) {};
  mu_1_link_smf0_upf0_ns2 (void): mu__byte(30, 30, 1) {};
  mu_1_link_smf0_upf0_ns2 (int val): mu__byte(30, 30, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -30]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -30],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_smf0_upf0_ns2::values[] = {"smf0_upf0_2",NULL };

/*** end of enum declaration ***/
mu_1_link_smf0_upf0_ns2 mu_1_link_smf0_upf0_ns2_undefined_var;

class mu_1_link_upf0_amf1_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_upf0_amf1_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_upf0_amf1_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_link_upf0_amf1_ns2::values[ int(val) - 31] );
    else return ( s << "Undefined" );
  };

  mu_1_link_upf0_amf1_ns2 (const char *name, int os): mu__byte(31, 31, 1, name, os) {};
  mu_1_link_upf0_amf1_ns2 (void): mu__byte(31, 31, 1) {};
  mu_1_link_upf0_amf1_ns2 (int val): mu__byte(31, 31, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -31]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -31],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_upf0_amf1_ns2::values[] = {"upf0_amf1_2",NULL };

/*** end of enum declaration ***/
mu_1_link_upf0_amf1_ns2 mu_1_link_upf0_amf1_ns2_undefined_var;

class mu_1_link_amf1_smf1_ns2: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_amf1_smf1_ns2& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_amf1_smf1_ns2& val)
  {
    if (val.defined())
      return ( s << mu_1_link_amf1_smf1_ns2::values[ int(val) - 32] );
    else return ( s << "Undefined" );
  };

  mu_1_link_amf1_smf1_ns2 (const char *name, int os): mu__byte(32, 32, 1, name, os) {};
  mu_1_link_amf1_smf1_ns2 (void): mu__byte(32, 32, 1) {};
  mu_1_link_amf1_smf1_ns2 (int val): mu__byte(32, 32, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -32]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -32],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_amf1_smf1_ns2::values[] = {"amf1_smf1_2",NULL };

/*** end of enum declaration ***/
mu_1_link_amf1_smf1_ns2 mu_1_link_amf1_smf1_ns2_undefined_var;

class mu_1_amf0_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf0_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf0_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_amf0_ns3::values[ int(val) - 33] );
    else return ( s << "Undefined" );
  };

  mu_1_amf0_ns3 (const char *name, int os): mu__byte(33, 33, 1, name, os) {};
  mu_1_amf0_ns3 (void): mu__byte(33, 33, 1) {};
  mu_1_amf0_ns3 (int val): mu__byte(33, 33, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -33]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -33],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf0_ns3::values[] = {"amf0_3",NULL };

/*** end of enum declaration ***/
mu_1_amf0_ns3 mu_1_amf0_ns3_undefined_var;

class mu_1_smf0_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf0_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf0_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_smf0_ns3::values[ int(val) - 34] );
    else return ( s << "Undefined" );
  };

  mu_1_smf0_ns3 (const char *name, int os): mu__byte(34, 34, 1, name, os) {};
  mu_1_smf0_ns3 (void): mu__byte(34, 34, 1) {};
  mu_1_smf0_ns3 (int val): mu__byte(34, 34, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -34]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -34],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf0_ns3::values[] = {"smf0_3",NULL };

/*** end of enum declaration ***/
mu_1_smf0_ns3 mu_1_smf0_ns3_undefined_var;

class mu_1_upf0_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_upf0_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_upf0_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_upf0_ns3::values[ int(val) - 35] );
    else return ( s << "Undefined" );
  };

  mu_1_upf0_ns3 (const char *name, int os): mu__byte(35, 35, 1, name, os) {};
  mu_1_upf0_ns3 (void): mu__byte(35, 35, 1) {};
  mu_1_upf0_ns3 (int val): mu__byte(35, 35, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -35]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -35],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_upf0_ns3::values[] = {"upf0_3",NULL };

/*** end of enum declaration ***/
mu_1_upf0_ns3 mu_1_upf0_ns3_undefined_var;

class mu_1_amf1_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf1_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf1_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_amf1_ns3::values[ int(val) - 36] );
    else return ( s << "Undefined" );
  };

  mu_1_amf1_ns3 (const char *name, int os): mu__byte(36, 36, 1, name, os) {};
  mu_1_amf1_ns3 (void): mu__byte(36, 36, 1) {};
  mu_1_amf1_ns3 (int val): mu__byte(36, 36, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -36]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -36],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf1_ns3::values[] = {"amf1_3",NULL };

/*** end of enum declaration ***/
mu_1_amf1_ns3 mu_1_amf1_ns3_undefined_var;

class mu_1_smf1_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf1_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf1_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_smf1_ns3::values[ int(val) - 37] );
    else return ( s << "Undefined" );
  };

  mu_1_smf1_ns3 (const char *name, int os): mu__byte(37, 37, 1, name, os) {};
  mu_1_smf1_ns3 (void): mu__byte(37, 37, 1) {};
  mu_1_smf1_ns3 (int val): mu__byte(37, 37, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -37]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -37],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf1_ns3::values[] = {"smf1_3",NULL };

/*** end of enum declaration ***/
mu_1_smf1_ns3 mu_1_smf1_ns3_undefined_var;

class mu_1_link_amf0_smf0_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_amf0_smf0_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_amf0_smf0_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_link_amf0_smf0_ns3::values[ int(val) - 38] );
    else return ( s << "Undefined" );
  };

  mu_1_link_amf0_smf0_ns3 (const char *name, int os): mu__byte(38, 38, 1, name, os) {};
  mu_1_link_amf0_smf0_ns3 (void): mu__byte(38, 38, 1) {};
  mu_1_link_amf0_smf0_ns3 (int val): mu__byte(38, 38, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -38]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -38],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_amf0_smf0_ns3::values[] = {"amf0_smf0_3",NULL };

/*** end of enum declaration ***/
mu_1_link_amf0_smf0_ns3 mu_1_link_amf0_smf0_ns3_undefined_var;

class mu_1_link_smf0_upf0_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_smf0_upf0_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_smf0_upf0_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_link_smf0_upf0_ns3::values[ int(val) - 39] );
    else return ( s << "Undefined" );
  };

  mu_1_link_smf0_upf0_ns3 (const char *name, int os): mu__byte(39, 39, 1, name, os) {};
  mu_1_link_smf0_upf0_ns3 (void): mu__byte(39, 39, 1) {};
  mu_1_link_smf0_upf0_ns3 (int val): mu__byte(39, 39, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -39]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -39],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_smf0_upf0_ns3::values[] = {"smf0_upf0_3",NULL };

/*** end of enum declaration ***/
mu_1_link_smf0_upf0_ns3 mu_1_link_smf0_upf0_ns3_undefined_var;

class mu_1_link_upf0_amf1_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_upf0_amf1_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_upf0_amf1_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_link_upf0_amf1_ns3::values[ int(val) - 40] );
    else return ( s << "Undefined" );
  };

  mu_1_link_upf0_amf1_ns3 (const char *name, int os): mu__byte(40, 40, 1, name, os) {};
  mu_1_link_upf0_amf1_ns3 (void): mu__byte(40, 40, 1) {};
  mu_1_link_upf0_amf1_ns3 (int val): mu__byte(40, 40, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -40]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -40],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_upf0_amf1_ns3::values[] = {"upf0_amf1_3",NULL };

/*** end of enum declaration ***/
mu_1_link_upf0_amf1_ns3 mu_1_link_upf0_amf1_ns3_undefined_var;

class mu_1_link_amf1_smf1_ns3: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_amf1_smf1_ns3& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_amf1_smf1_ns3& val)
  {
    if (val.defined())
      return ( s << mu_1_link_amf1_smf1_ns3::values[ int(val) - 41] );
    else return ( s << "Undefined" );
  };

  mu_1_link_amf1_smf1_ns3 (const char *name, int os): mu__byte(41, 41, 1, name, os) {};
  mu_1_link_amf1_smf1_ns3 (void): mu__byte(41, 41, 1) {};
  mu_1_link_amf1_smf1_ns3 (int val): mu__byte(41, 41, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -41]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -41],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_amf1_smf1_ns3::values[] = {"amf1_smf1_3",NULL };

/*** end of enum declaration ***/
mu_1_link_amf1_smf1_ns3 mu_1_link_amf1_smf1_ns3_undefined_var;

class mu_1_amf0_ns4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf0_ns4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf0_ns4& val)
  {
    if (val.defined())
      return ( s << mu_1_amf0_ns4::values[ int(val) - 42] );
    else return ( s << "Undefined" );
  };

  mu_1_amf0_ns4 (const char *name, int os): mu__byte(42, 42, 1, name, os) {};
  mu_1_amf0_ns4 (void): mu__byte(42, 42, 1) {};
  mu_1_amf0_ns4 (int val): mu__byte(42, 42, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -42]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -42],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf0_ns4::values[] = {"amf0_4",NULL };

/*** end of enum declaration ***/
mu_1_amf0_ns4 mu_1_amf0_ns4_undefined_var;

class mu_1_smf0_ns4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf0_ns4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf0_ns4& val)
  {
    if (val.defined())
      return ( s << mu_1_smf0_ns4::values[ int(val) - 43] );
    else return ( s << "Undefined" );
  };

  mu_1_smf0_ns4 (const char *name, int os): mu__byte(43, 43, 1, name, os) {};
  mu_1_smf0_ns4 (void): mu__byte(43, 43, 1) {};
  mu_1_smf0_ns4 (int val): mu__byte(43, 43, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -43]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -43],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf0_ns4::values[] = {"smf0_4",NULL };

/*** end of enum declaration ***/
mu_1_smf0_ns4 mu_1_smf0_ns4_undefined_var;

class mu_1_upf0_ns4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_upf0_ns4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_upf0_ns4& val)
  {
    if (val.defined())
      return ( s << mu_1_upf0_ns4::values[ int(val) - 44] );
    else return ( s << "Undefined" );
  };

  mu_1_upf0_ns4 (const char *name, int os): mu__byte(44, 44, 1, name, os) {};
  mu_1_upf0_ns4 (void): mu__byte(44, 44, 1) {};
  mu_1_upf0_ns4 (int val): mu__byte(44, 44, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -44]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -44],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_upf0_ns4::values[] = {"upf0_4",NULL };

/*** end of enum declaration ***/
mu_1_upf0_ns4 mu_1_upf0_ns4_undefined_var;

class mu_1_amf1_ns4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_amf1_ns4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_amf1_ns4& val)
  {
    if (val.defined())
      return ( s << mu_1_amf1_ns4::values[ int(val) - 45] );
    else return ( s << "Undefined" );
  };

  mu_1_amf1_ns4 (const char *name, int os): mu__byte(45, 45, 1, name, os) {};
  mu_1_amf1_ns4 (void): mu__byte(45, 45, 1) {};
  mu_1_amf1_ns4 (int val): mu__byte(45, 45, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -45]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -45],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_amf1_ns4::values[] = {"amf1_4",NULL };

/*** end of enum declaration ***/
mu_1_amf1_ns4 mu_1_amf1_ns4_undefined_var;

class mu_1_smf1_ns4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_smf1_ns4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_smf1_ns4& val)
  {
    if (val.defined())
      return ( s << mu_1_smf1_ns4::values[ int(val) - 46] );
    else return ( s << "Undefined" );
  };

  mu_1_smf1_ns4 (const char *name, int os): mu__byte(46, 46, 1, name, os) {};
  mu_1_smf1_ns4 (void): mu__byte(46, 46, 1) {};
  mu_1_smf1_ns4 (int val): mu__byte(46, 46, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -46]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -46],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_smf1_ns4::values[] = {"smf1_4",NULL };

/*** end of enum declaration ***/
mu_1_smf1_ns4 mu_1_smf1_ns4_undefined_var;

class mu_1_link_amf0_smf0_ns4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_amf0_smf0_ns4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_amf0_smf0_ns4& val)
  {
    if (val.defined())
      return ( s << mu_1_link_amf0_smf0_ns4::values[ int(val) - 47] );
    else return ( s << "Undefined" );
  };

  mu_1_link_amf0_smf0_ns4 (const char *name, int os): mu__byte(47, 47, 1, name, os) {};
  mu_1_link_amf0_smf0_ns4 (void): mu__byte(47, 47, 1) {};
  mu_1_link_amf0_smf0_ns4 (int val): mu__byte(47, 47, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -47]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print(FILE *target, const char *separator)
  {
    if (defined())
    fprintf(target,"%s: %s%s",name,values[ value() -47],separator); 
    else
    fprintf(target,"%s: Undefined%s",name,separator); 
  };
};

const char *mu_1_link_amf0_smf0_ns4::values[] = {"amf0_smf0_4",NULL };

/*** end of enum declaration ***/
mu_1_link_amf0_smf0_ns4 mu_1_link_amf0_smf0_ns4_undefined_var;

class mu_1_link_smf0_upf0_ns4: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_link_smf0_upf0_ns4& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_link_smf0_upf0_ns4& val)
  {
    if (val.defined())
      return ( s << mu_1_link_smf0_upf0_ns4::values[ int(val) - 48] );
    else return ( s << "Undefined" );
  };

  mu_1_link_smf0_upf0_ns4 (const char *name, int os): mu__byte(48, 48, 1, name, os) {};
  mu_1_link_smf0_upf0_ns4 (void): mu__byte(48, 48, 1) {};
  mu_1_link_smf0_upf0_ns4 (int val): mu__byte(48, 48, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -48]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet