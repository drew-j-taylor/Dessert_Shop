------------------------------------------------------------------------------
--                                                                          --
--  Dessert  
--  Spec
--  
--  Dessert_Items is abstract parent or interface class
--  Candy, Cookies, and Ice_Cream inherit from Dessert_Items
--  Sundae inherits from Ice_Cream
--                                                                          --
------------------------------------------------------------------------------

with Ada.Strings.Unbounded;

package Dessert is 

    use Ada.Strings.Unbounded;

    type Dessert_Item is abstract tagged record
        Name : Unbounded_String := To_Unbounded_String("");
    end record;

    
    function Calculate_Cost (Item : Dessert_Item) return Float is abstract;

    function Calculate_Tax (Item : Dessert_Item'Class) return Float;

    --  Candy type
    type Candy is new Dessert_Item with record 
        Weight : Float := 0.0;
        Price_Per_Pound : Float := 0.0;
    end record;

    function Calculate_Cost (Item : Candy) return Float;

    --  Cookie type
    type Cookie is new Dessert_Item with record
        Quantity : Integer := 0;
        Price_Per_Dozen : Float := 0.0;
    end record;

    function Calculate_Cost (Item : Cookie) return Float;

    --  Ice cream type
    type Ice_Cream is new Dessert_Item with record
        Scoop_Count : Integer := 0;
        Price_Per_Scoop : Float := 0.0;
    end record;

    function Calculate_Cost (Item : Ice_Cream) return Float;

    --  sundae type
    type Sundae is new Ice_Cream with record
        Topping_Name : Unbounded_String := To_Unbounded_String("");
        Topping_Price : Float := 0.0;
    end record;

    function Calculate_Cost (Item : Sundae) return Float;

    --  function "=" (L, R : Dessert_Item'Class) return Boolean;

end Dessert;
