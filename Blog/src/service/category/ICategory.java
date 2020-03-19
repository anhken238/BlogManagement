package service.category;

import model.Category;

import java.util.List;

public interface ICategory {
    public boolean createCategory(Category category);

    public Category getCategoryById(int id);

    public List<Category> getAllCategory();

    public List<Category> getNameCategory();

    public boolean updateCategory(Category category);

    public boolean deleteCategory(Category category);
}
