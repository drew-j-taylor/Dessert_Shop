------------------------------------------------------------------------------
--                                                                          
--  Order 
--  Spec
--  
--  Order is a simple container package for holding Dessert Items of any 
--  combination of sub-type
--                                                                          
------------------------------------------------------------------------------

with Dessert;
with Array_List;

package Order is 

    package Order_List is new Array_List (T => Dessert.Dessert_Item'Class);

    type Order is record 
        Items : Order_List.Array_List := Order_List.New_List;
    end record;

    procedure Add (O : in out Order; Item : Dessert.Dessert_Item'Class); 

    function Count (O : Order) return Natural;

    function Order_Cost (O : Order) return Float;

    procedure Print_Order (O : Order);
    

end Order;
