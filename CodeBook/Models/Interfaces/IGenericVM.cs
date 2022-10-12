using CodeBook.Models.Enums;
using System.Collections.Generic;

namespace CodeBook.Models.Interfaces
{
    public interface IGenericVM<T> where T : class
    {

        Status Status { get; }
        T Data { get; }
        List<string> Messages { get; }
        int Datalength { get; }
        string CurrentLanguage { get; }
        string ISValidCaptcha { get; }
        string ParentID { get; }



    }
}