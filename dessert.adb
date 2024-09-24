------------------------------------------------------------------------------
--                                                                          --
--  Dessert 
--  Body 
--  
--  Dessert_Items is abstract parent or interface class
--  Candy, Cookies, and Ice_Cream inherit from Dessert_Items
--  Sundae inherits from Ice_Cream
--                                                                          --
------------------------------------------------------------------------------

with Ada.Strings.Unbounded;

package body Dessert is 

    use Ada.Strings.Unbounded;

    function Calculate_Tax (Item : Dessert_Item'Class) return Float is
    begin
        return Tax_Rate * Calculate_Cost(Item) / 100.0;
    end Calculate_Tax;

    --  Candy
    function Calculate_Cost (Item : Candy) return Float is 
    begin 
        return Item.Weight * Item.Price_Per_Pound;
    end Calculate_Cost;

    --  Cookie
    function Calculate_Cost (Item : Cookie) return Float is
    begin 
        return Float(Item.Quantity) * Item.Price_Per_Dozen / 12.0;
    end Calculate_Cost;

    --  Ice cream
    function Calculate_Cost (Item : Ice_Cream) return Float is 
    begin 
        return Float(Item.Scoop_Count) * Item.Price_Per_Scoop;
    end Calculate_Cost;

    --  sundae
    function Calculate_Cost (Item : Sundae) return Float is 
    begin 
        return Item.Topping_Price + Calculate_Cost(Ice_Cream(Item));
    end Calculate_Cost;

    --  function "=" (L, R : Dessert_Item'Class) return Boolean is 
    --  begin 
    --      if L.Name = R.Name then 
    --          return True;
    --      else 
    --          return False;
    --      end if;
        
    --  end "=";

end Dessert;


