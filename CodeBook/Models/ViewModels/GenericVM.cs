using CodeBook.Models.Interfaces;

namespace CodeBook.Models.ViewModels
{
    public class GenericVM<T> : ResponseVM, IGenericVM<T> where T : class
    {
        public T Data { get; set; }

    }
}