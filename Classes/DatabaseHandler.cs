using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MalayanEventHub.Classes
{
    //class for handling the database
    public class DatabaseHandler
    {
        private SqlConnection dbConn;
        private bool isValidRequest;
        public DatabaseHandler()
        {
            try
            {
                dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString);
                isValidRequest = true;
            }
            catch (Exception ex)
            {
                isValidRequest = false;
                throw ex;
            }

        }

        internal void ExecuteUpdateQuery(string queryCMD)
        {
            if (!isValidRequest)
            {
                throw new Exception("Error Initializing Sql Connection Object.");
            }

            //execute query
            dbConn.Open();
            SqlCommand dbCMD = new SqlCommand(queryCMD, dbConn);
            dbCMD.ExecuteNonQuery();
            //close db connection
            dbConn.Close();
        }

        internal List<Dictionary<string, string>> RetrieveData(string queryCMD)
        {
            if (!isValidRequest)
            {
                throw new Exception("Error Initializing Sql Connection Object.");
            }
            //Initializing a data list
            List<Dictionary<string, string>> dataList = new List<Dictionary<string, string>>();

            //execute query
            dbConn.Open();
            SqlCommand dbCMD = new SqlCommand(queryCMD, dbConn);
            SqlDataReader dataReader = dbCMD.ExecuteReader();
            //iterate every record
            while(dataReader.Read())
            {
                //make new dictionary
                Dictionary<string, string> dict = new Dictionary<string, string>();
                //get fieldname and value
                //store it to a dictionary
                for(int i=0; i<dataReader.FieldCount; i++)
                {
                    string fieldName = dataReader.GetName(i);
                    string value = dataReader[fieldName].ToString();

                    dict[fieldName] = value;
                }

                //add to list
                dataList.Add(dict);
            }

            //close db connection
            dbConn.Close();


            //return datalist
            return dataList;
        }

        internal bool GetRequestStatus()
        {
            return isValidRequest;
        }
    }
}