------------------------------------------------------------------------------
--                                                                          
--  Array_List 
--  Body 
--  
--  Array_List is a simple container package similar to a vector in C++ 
--                                                                          
------------------------------------------------------------------------------


with Ada.Text_IO;
with Ada.Unchecked_Deallocation;

package body Array_List is 

    procedure Free_D is new Ada.Unchecked_Deallocation (Array_List_Data, Data_Access);
    procedure Free is new Ada.Unchecked_Deallocation (T, T_access);
    procedure Free_Data (A : in out Data_Access) is 
    begin 
        for i in A'Range loop 
            if A(i) /= null then 
                Free(A(i));
            end if;
        end loop;
        Free_D(A);
    end Free_Data;

    function New_List return Array_List is 
        New_List : Array_List := new Array_List_Impl;
    begin 
        New_List.Capacity := CHUNK;
        New_List.Num_Elements := 0;
        New_List.Data := new Array_List_Data(0..(CHUNK - 1));
        return New_List;
    end New_List;

    --  Allocate a new array which is one CHUNK larger than the previous one
    procedure Grow (A : Array_List) is 
        New_Cap : Natural := A.Capacity + CHUNK;
        New_Data : Data_Access := new Array_List_Data (0..(New_Cap - 1));
    begin 
        New_Data (0..(A.Capacity - 1)) := A.Data (0..(A.Capacity - 1));
        Free_Data(A.Data);
        A.Data := New_Data;
        A.Capacity := New_Cap;
    end Grow;

    --  Reduces the unused space in the buffer
    procedure Shrink (A : Array_List) is 
        New_Data : Data_Access;
    begin 
        if A.Num_Elements = 0 then 
            A.Capacity := CHUNK;
        else 
            A.Capacity := (A.Num_Elements - 1) + CHUNK - ((A.Num_Elements - 1) mod CHUNK);
        end if;
        New_Data := new Array_List_Data (0..(A.Capacity - 1));
        New_Data (0..(A.Capacity - 1)) := A.Data (0..(A.Capacity - 1));
        Free_Data(A.Data);
        A.Data := New_Data;
    end Shrink;

    --  Append a new element at the end of the array
    procedure Push_Back (A : Array_List; Item : T) is 
    begin 
        if A.Num_Elements + 1 >= A.Capacity then 
            Grow(A);
        end if;
        --  A.Data(A.Num_Elements) := Item;
        A.Data(A.Num_Elements) := new T'(Item);
        A.Num_Elements := A.Num_Elements + 1;
    end Push_Back;

    --  Return element in position "Position" (0-based)
    function At_Index (A : Array_List; Position : Natural) return T is 
    begin 
        return A.Data(Position).all;
    end At_Index;

    --  return number of elements
    function Size (A : Array_List) return Natural is 
    begin 
        return A.Num_Elements;
    end Size;

    --  Return the element in position 0, if any
    function Front(A : Array_List) return T is 
    begin 
        if A.Num_Elements < 1 then 
            raise Constraint_Error;
        end if;
        return A.Data(0).all;
    end Front;

    --  Return last element, if any
    function Back(A : Array_List) return T is 
    begin 
        if A.Num_Elements < 1 then 
            raise Constraint_Error;
        end if;
        return A.Data(A.Num_Elements - 1).all;
    end Back;
    
    procedure Clear (A : Array_List) is 
    begin 
        A.Num_Elements := 0;
        if A.Capacity > CHUNK then 
            Shrink(A);
        end if;
    end Clear;

    -- Last element removed
    procedure Pop_Back (A : Array_List) is 
    begin 
        if A.Num_Elements < 1 then 
            raise Constraint_Error;
        end if;
        A.Num_Elements := A.Num_Elements - 1;
        if A.Capacity - A.Num_Elements > CHUNK then 
            Shrink(A);
        end if;
    end Pop_Back;

    --  Remove item in position "Position" and shuffles following items left
    procedure Erase (A : Array_List; Position : Natural) is 
        Temp_Data : Data_Access;
    begin 
        if A.Num_Elements <= Position then 
            raise Constraint_Error;
        end if;

        if A.Capacity - (A.Num_Elements - 1) > CHUNK then 
            A.Capacity := (A.Num_Elements - 1) + CHUNK - ((A.Num_Elements - 1) mod CHUNK);
        end if;

        Temp_Data := new Array_List_Data (0..(A.Capacity - 1));

        if Position = 0 then 
            Temp_Data (0..(A.Num_Elements - 2)) := A.Data (1..(A.Num_Elements - 1));
        else 
            Temp_Data (0..(Position - 1)) := A.Data(0..(Position - 1));
            Temp_Data (Position..(A.Num_Elements - 2)) := A.Data ((Position + 1)..(A.Num_Elements - 1));
        end if;

        Free_Data(A.Data);
        A.Data := Temp_Data;
        A.Num_Elements := A.Num_Elements - 1;
    end Erase;

    --  Shuffle items right to make room for a new element at "Position"
    procedure Insert (A : Array_List; Position : Natural; Item : T) is 
        Temp_Data : Data_Access;
    begin 
        if A.Num_Elements + 1 >= A.Capacity then 
            Grow(A);
        end if;
        Temp_Data := new Array_List_Data (0..(A.Capacity - 1));

        Temp_Data (0..(Position - 1)) := A.Data(0..(Position - 1));
        --  Temp_Data (Position) := Item;
        Temp_Data (Position) := new T'(Item);
        Temp_Data ((Position + 1)..(A.Num_Elements)) := A.Data (Position..(A.Num_Elements - 1));

        Free_Data(A.Data);
        A.Num_Elements := A.Num_Elements + 1;
        A.Data := Temp_Data;
    end Insert;

end Array_List;
