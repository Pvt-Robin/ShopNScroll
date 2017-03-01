package com.arms.shopnscroll.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.arms.shopnscroll.model.Category;
import com.arms.shopnscroll.model.SubCategory;
import com.arms.shopnscroll.service.CategoryService;
import com.arms.shopnscroll.service.SubCategoryService;

@Controller
public class SubCategoryController 
{
	@Autowired
	SubCategoryService subCategoryService;
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("/subcategory")
	public String getSubCategoryPage(@ModelAttribute("subCategory")SubCategory subCategory, Model model)
	{
		List<SubCategory> subCatList = subCategoryService.fetchAllSubCategory();
		model.addAttribute("subCategoryList", subCatList);
		model.addAttribute("subcategory", new SubCategory());
		model.addAttribute("categoryList", categoryService.fetchAllCategory());
		model.addAttribute("btnLabel","Add");

		return "admin-subcategory";
	}
	
	@RequestMapping("/updatesubcategory-{subCategoryId}")
	public String updateSubCategory(@PathVariable("subCategoryId")int subCategoryId,@ModelAttribute("subCategory")SubCategory subCategory, Model model)
	{
		List<SubCategory> subCatList = subCategoryService.fetchAllSubCategory();
		model.addAttribute("subCategoryList", subCatList);
		model.addAttribute("subcategory", subCategoryService.fetchOneSubCategory(subCategoryId));
		model.addAttribute("btnLabel","Add");

		return "admin-subcategory";
	}
	
	@RequestMapping("/addsubcategory")
	public String addSubCategory(@ModelAttribute("subCategory")SubCategory subCategory, Model model)
	{
		Category category = categoryService.fetchOneCategory(subCategory.getCategory().getCategoryId());
		subCategory.setCategory(category);
		subCategoryService.addSubCategory(subCategory);
		return "redirect:/subcategory";
	}
	
	@RequestMapping("/removesubcategory-{subCategoryId}")
	public String removeSubCategory(@PathVariable("subCategoryId")int subCategoryId)
	{
		subCategoryService.removeSubCategory(subCategoryId);
		return "redirect:/subcategory";
	}
	
}
