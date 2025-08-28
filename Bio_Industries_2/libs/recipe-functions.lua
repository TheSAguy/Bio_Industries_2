local BioInd = require('common')('Bio_Industries_2')

if not thxbob.lib.recipe then thxbob.lib.recipe = {} end


function thxbob.lib.recipe.replace_ingredient(recipe, old, new)
  local retval = false
  if data.raw.recipe[recipe] and thxbob.lib.item.get_type(new) then

    local amount = 0
    if data.raw.recipe[recipe].ingredients then
      for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
        local item = thxbob.lib.item.basic_item(ingredient)
        if item.name == old then
          amount = item.amount + amount
        end
      end
      if amount > 0 then
        if thxbob.lib.item.get_type(old) == "fluid" and thxbob.lib.item.get_type(new) == "item" then
          amount = math.ceil(amount / 10)
        end
        if thxbob.lib.item.get_type(old) == "item" and thxbob.lib.item.get_type(new) == "fluid" then
          amount = amount * 10
        end
        thxbob.lib.recipe.remove_ingredient(recipe, old)
        thxbob.lib.recipe.add_ingredient(recipe, {new, amount})
        return true
      else
        return false
      end
    end
  else
    if not data.raw.recipe[recipe] then
      BioInd.writeDebug("Recipe %s does not exist.", {recipe})
    end
    if not thxbob.lib.item.get_type(new) then
      BioInd.writeDebug("Ingredient %s does not exist.", {new})
    end
      end

  return retval
end


function thxbob.lib.recipe.replace_ingredient_in_all(old, new)
  if thxbob.lib.item.get_basic_type(new) then
    for i, recipe in pairs(data.raw.recipe) do
      thxbob.lib.recipe.replace_ingredient(recipe.name, old, new)
    end
  else
    BioInd.writeDebug("Ingredient %s does not exist.", {new})
  end
end


function thxbob.lib.recipe.remove_ingredient(recipe, item)
  if data.raw.recipe[recipe] then
    if data.raw.recipe[recipe].ingredients then
      thxbob.lib.item.remove(data.raw.recipe[recipe].ingredients, item)
    end

  else
    BioInd.writeDebug("Recipe %s does not exist.", {recipe})
  end
end


function thxbob.lib.recipe.add_new_ingredient(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_type(thxbob.lib.item.basic_item(item).name) then
    if data.raw.recipe[recipe].ingredients then
      thxbob.lib.item.add_new(data.raw.recipe[recipe].ingredients, thxbob.lib.item.basic_item(item))
    end

  else
    if not data.raw.recipe[recipe] then
      BioInd.writeDebug("Recipe %s does not exist.", {recipe})
    end
    if not thxbob.lib.item.get_type(item) then
      BioInd.writeDebug("Ingredient %s does not exist.", {thxbob.lib.item.basic_item(item).name})
    end
  end
end

function thxbob.lib.recipe.add_ingredient(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_type(thxbob.lib.item.basic_item(item).name) then
    if data.raw.recipe[recipe].ingredients then
      thxbob.lib.item.add(data.raw.recipe[recipe].ingredients, thxbob.lib.item.basic_item(item))
    end

  else
    if not data.raw.recipe[recipe] then
      BioInd.writeDebug("Recipe %s does not exist.", {recipe})
    end
    if not thxbob.lib.item.get_basic_type(thxbob.lib.item.basic_item(item).name) then
      BioInd.writeDebug("Ingredient %s does not exist.", {thxbob.lib.item.basic_item(item).name})
    end
  end
end

function thxbob.lib.recipe.set_ingredient(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_type(thxbob.lib.item.basic_item(item).name) then
    if data.raw.recipe[recipe].ingredients then
      thxbob.lib.item.set(data.raw.recipe[recipe].ingredients, thxbob.lib.item.basic_item(item))
    end

  else
    if not data.raw.recipe[recipe] then
      BioInd.writeDebug("Recipe %s does not exist.", {recipe})
    end
    if not thxbob.lib.item.get_basic_type(thxbob.lib.item.basic_item(item).name) then
      BioInd.writeDebug("Ingredient %s does not exist.", {thxbob.lib.item.basic_item(item).name})
    end
  end
end


function thxbob.lib.recipe.add_result(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_type(thxbob.lib.item.basic_item(item).name) then
    if data.raw.recipe[recipe].result or data.raw.recipe[recipe].results then
      thxbob.lib.result_check(data.raw.recipe[recipe])
      thxbob.lib.item.add(data.raw.recipe[recipe].results, item)
    end

  else
    if not data.raw.recipe[recipe] then
      BioInd.writeDebug("Recipe %s does not exist.", {recipe})
    end
    if not thxbob.lib.item.get_basic_type(thxbob.lib.item.basic_item(item).name) then
      BioInd.writeDebug("Item %s does not exist.", {thxbob.lib.item.basic_item(item).name})
    end
  end
end

function thxbob.lib.recipe.set_result(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_type(thxbob.lib.item.basic_item(item).name) then
    if data.raw.recipe[recipe].result or data.raw.recipe[recipe].results then
      thxbob.lib.result_check(data.raw.recipe[recipe])
      thxbob.lib.item.set(data.raw.recipe[recipe].results, item)
    end

  else
    if not data.raw.recipe[recipe] then
      BioInd.writeDebug("Recipe %s does not exist.", {recipe})
    end
    if not thxbob.lib.item.get_basic_type(thxbob.lib.item.basic_item(item).name) then
      BioInd.writeDebug("Item %s does not exist.", {thxbob.lib.item.basic_item(item).name})
    end
  end
end

function thxbob.lib.recipe.remove_result(recipe, item)
local f_name = "remove_result"
BioInd.writeDebug("Entered function %s(%s, %s)", {f_name, recipe, item})
  if data.raw.recipe[recipe] then
    if data.raw.recipe[recipe].result or data.raw.recipe[recipe].results then
      thxbob.lib.result_check(data.raw.recipe[recipe])
      thxbob.lib.item.remove(data.raw.recipe[recipe].results, item)
    end

  else
    BioInd.writeDebug("Recipe %s does not exist.", {recipe})
  end
end