using PMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMS.BAL
{
    public class CommentBO
    {
        public static int Save(CommentDTO dto)
        {
            return PMS.DAL.CommentDAO.Save(dto);
        }

        public static CommentDTO GetCommentById(int pid)
        {
            return PMS.DAL.CommentDAO.GetCommentById(pid);
        }
        public static List<CommentDTO> GetAllComments()
        {
            return PMS.DAL.CommentDAO.GetAllComments();
        }


    }
}
