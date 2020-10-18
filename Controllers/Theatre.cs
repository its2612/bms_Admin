using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BMS_Admin.Controllers
{
    public class Theatre
    {
        [BsonId]
        public ObjectId TheatreID { get; set; }


        public string TheatreName { get; set; }

        public int Seat { get; set; }




    }
}