// Author: Devin Ireland
// Project: LogIn
// Date: 2016-02

// ReSharper disable All

public class Customer
{
    public int CustomerId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Username { get; set; }

    public override string ToString()
    {
        return string.Format("{0}{1}", 
            FirstName != null ? FirstName + " " : string.Empty,
            LastName ?? string.Empty);
    }
}