------------------------------------------------------------------------------
--                                                                         
--  Array_List 
--  Spec
--  
--  Array_List is a simple container package similar to a vector in C++ 
--                                                                          
------------------------------------------------------------------------------


with Ada.Finalization;


generic
    type T (<>) is private;
    
package Array_List is 
    
    type Array_List_Impl is private;
    type Array_List is access all Array_List_Impl;

    function New_List return Array_List;
    
    procedure Push_Back (A : Array_List; Item : T);
    function At_Index (A : Array_List; Position : Natural) return T; 
    function Size (A : Array_List) return Natural;

    function Front(A : Array_List) return T;
    function Back(A : Array_List) return T;
    procedure Clear (A : Array_List);

    procedure Pop_Back (A : Array_List);
    procedure Erase (A : Array_List; Position : Natural);
    procedure Insert (A : Array_List; Position : Natural; Item : T);

private
    CHUNK : Natural := 8;
    type T_access is access T;
    type Array_List_Data is array (Natural range <>) of T_access;
    --  type Array_List_Data is array (Natural range <>) of T;
    type Data_Access is access all Array_List_Data;

    type Array_List_Impl is record 
        Capacity : Natural := 0; 
        Num_Elements : Natural := 0; 
        Data : Data_Access := null;
    end record;

    procedure Grow(A : Array_List);
    procedure Shrink (A : Array_List);

end Array_List;
