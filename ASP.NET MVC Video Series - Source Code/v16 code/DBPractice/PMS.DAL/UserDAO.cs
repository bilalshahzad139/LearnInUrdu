using PMS.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.DAL
{
    public static class UserDAO
    {
        public static int Save(UserDTO dto)
        {
            String sqlQuery = "";
            if (dto.UserID > 0)
            {
                sqlQuery = String.Format("Update dbo.Users Set Name='{0}', PictureName='{1}' Where UserID={2}",
                    dto.Name, dto.PictureName, dto.UserID);
            }
            else
            {
                sqlQuery = String.Format("INSERT INTO dbo.Users(Name, Login,Password, PictureName, IsAdmin,IsActive) VALUES('{0}','{1}','{2}','{3}',{4},{5})",
                    dto.Name, dto.Login, dto.Password, dto.PictureName, 0, 1);
            }

            using (DBHelper helper = new DBHelper())
            {
                return helper.ExecuteQuery(sqlQuery);
            }
        }

        public static int UpdatePassword(UserDTO dto)
        {
            String sqlQuery = "";
            sqlQuery = String.Format("Update dbo.Users Set Password='{0}' Where UserID={1}", dto.Password, dto.UserID);


            using (DBHelper helper = new DBHelper())
            {
                return helper.ExecuteQuery(sqlQuery);
            }
        }

        public static UserDTO ValidateUser(String pLogin, String pPassword)
        {
            var query = String.Format("Select * from dbo.Users Where Login='{0}' and Password='{1}'", pLogin, pPassword);

            using (DBHelper helper = new DBHelper())
            {
                var reader = helper.ExecuteReader(query);

                UserDTO dto = null;

                if (reader.Read())
                {
                    dto = FillDTO(reader);
                }

                return dto;
            }
        }

        public static UserDTO GetUserById(int pid)
        {

            var query = String.Format("Select * from dbo.Users Where UserId={0}", pid);

            using (DBHelper helper = new DBHelper())
            {
                var reader = helper.ExecuteReader(query);

                UserDTO dto = null;

                if (reader.Read())
                {
                    dto = FillDTO(reader);
                }

                return dto;
            }
        }

        public static List<UserDTO> GetAllUsers()
        {
            using (DBHelper helper = new DBHelper())
            {
                var query = "Select * from dbo.Users Where IsActive = 1;";
                var reader = helper.ExecuteReader(query);
                List<UserDTO> list = new List<UserDTO>();

                while (reader.Read())
                {
                    var dto = FillDTO(reader);
                    if (dto != null)
                    {
                        list.Add(dto);
                    }
                }

                return list;
            }
        }

        public static int DeleteUser(int pid)
        {
            String sqlQuery = String.Format("Update dbo.Users Set IsActive=0 Where UserID={0}", pid);

            using (DBHelper helper = new DBHelper())
            {
                return helper.ExecuteQuery(sqlQuery);
            }
        }

        private static UserDTO FillDTO(SqlDataReader reader)
        {
            var dto = new UserDTO();
            dto.UserID = reader.GetInt32(0);
            dto.Name = reader.GetString(1);
            dto.Login = reader.GetString(2);
            dto.Password = reader.GetString(3);
            dto.PictureName = reader.GetString(4);
            dto.IsAdmin = reader.GetBoolean(5);
            dto.IsActive = reader.GetBoolean(6);

            return dto;
        }
    }
}
