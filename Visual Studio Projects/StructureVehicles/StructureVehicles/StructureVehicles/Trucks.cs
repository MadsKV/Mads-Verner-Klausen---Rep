﻿using System;
using System.Collections.Generic;
using System.Text;

namespace StructureVehicles
{
    class Trucks : Vehicle
    {
        public Trucks(string name,
            double km,
            string registrationNumber,
            int year,
            double newPrice,
            bool towbar,
            double engineSize,
            double kmPerLiter,
            fuelTypeEnum fuelType,
            energyClassEnum energyClass
            )
        {
            throw new NotImplementedException();
        }

        public override double EngineSize
        {
            get { return this.engineSize; }
            set
            {
                if (value < 4.2 || value > 15.0)
                    throw new ArgumentOutOfRangeException(
                        $"{nameof(value)} Must be between 4.2 and 15.0 L.");

                this.engineSize = value;
            }
        }

        public override string ToString()
        {
            throw new NotImplementedException();
        }

















        /*
        public int capacity;
        public int height;
        public int weight;
        public int length;
        public string licenseType;
        */
    }
}
