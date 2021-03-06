﻿using System;
using System.Collections.Generic;
using System.Text;

namespace StructureVehicles
{
    abstract class Vehicle
    {
        //Protected Vehicle class
        protected Vehicle(string name,
            double km,
            string registrationNumber,
            int year,
            double newPrice,
            bool towbar,
            double engineSize,
            double kmPerLiter,
            fuelTypeEnum fuelType)
        {
            //Vehicle Constructor
            this.Name = name;
            this.Km = km;
            this.RegistrationNumber = registrationNumber;
            this.Year = year;
            this.NewPrice = newPrice;
            this.Towbar = towbar;
            this.engineSize = engineSize;
            this.KmPerLiter = kmPerLiter;
            this.FuelType = fuelType;
            this.energyClass = GetEnergyClass();
        }
        
        /// <summary>
        /// Name Field and proberty
        /// </summary>
        public string Name
        {
            get { return name; }
            set { 
                if (value == null)
                {
                    throw new ArgumentNullException();
                }
                name = value; }
        }
        private string name;

        /// <summary>
        /// Km Field and proberty
        /// </summary>
        public double Km
        {
            get { return km; }
            set { km = value; }
        }
        private double km;

        /// <summary>
        /// RegistrationNumber Field and proberty
        /// </summary>
        public string RegistrationNumber
        {
            get { return RegistrationNumber; }
            set { registrationNumber = value; }
        }
        private string registrationNumber;

        /// <summary>
        /// Year Field and proberty
        /// </summary>
        public int Year
        {
            get { return year; }
            set { year = value; }
        }
        private int year;

        /// <summary>
        /// NewPrice Field and proberty
        /// </summary>
        public double NewPrice
        {
            get { return newPrice; }
            set { newPrice = value; }
        }
        private double newPrice;

        /// <summary>
        /// Towbar Field and proberty
        /// </summary>
        public bool Towbar
        {
            get { return towbar; }
            set { towbar = value; }
        }
        private bool towbar;

        /// <summary>
        /// EngineSize Field and proberty
        /// </summary>
        public virtual double EngineSize
        {
            get { return engineSize; }
            set { engineSize = value; }
        }
        protected double engineSize;

        /// <summary>
        /// KmPerLiter Field and proberty
        /// </summary>
        public double KmPerLiter
        {   get { return kmPerLiter; }
            set { kmPerLiter = value; }
        }
        private double kmPerLiter;

        /// <summary>
        /// DriverLicenseEnum Field and proberty
        /// </summary>
        public driverLicenseEnum DriverLisence;
        private driverLicenseEnum driverLicense;
        public enum driverLicenseEnum
        {
            A,
            B,
            C,
            D,
            BE,
            CE,
            DE,
        }

        /// <summary>
        /// FuelTypeEnum Field and proberty
        /// </summary>
        public fuelTypeEnum FuelType;
        private fuelTypeEnum fuelType;
        public enum fuelTypeEnum
        {
            Diesel,
            Benzine
        }

        /// <summary>
        /// EnergyClassEnum Field and proberty
        /// </summary>
        public energyClassEnum Energyclass
        {
            get { return energyClass; }
        }
        private energyClassEnum energyClass;
        public enum energyClassEnum
        {
            A,
            B,
            C,
            D
        }


        private energyClassEnum GetEnergyClass() {
            if (this.year < 2010)
            {
                if (this.fuelType is fuelTypeEnum.Diesel)
                {
                    if (this.kmPerLiter >= 23.0)
                    {
                        return energyClassEnum.A;
                    }
                    else if (this.kmPerLiter < 23.0 && this.kmPerLiter >= 18.0)
                    {
                        return energyClassEnum.B;
                    }
                    else if (this.kmPerLiter < 18.0 && this.kmPerLiter >= 13.0)
                    {
                        return energyClassEnum.C;
                    }
                    else if (this.kmPerLiter < 13.0)
                    {
                        return energyClassEnum.D;
                    }
                    else
                    {
                        throw new ArgumentOutOfRangeException();
                    }
                }
                else
                {
                    if (this.kmPerLiter >= 18.0)
                    {
                        return energyClassEnum.A;
                    }
                    else if (this.kmPerLiter < 18.0 && this.kmPerLiter >= 14.0)
                    {
                        return energyClassEnum.B;
                    }
                    else if (this.kmPerLiter < 14.0 && this.kmPerLiter >= 10.0)
                    {
                        return energyClassEnum.C;
                    }
                    else if (this.kmPerLiter < 10.0)
                    {
                        return energyClassEnum.D;
                    }
                    else
                    {
                        throw new ArgumentOutOfRangeException();
                    }
                }
            }
            else
            {
                if (this.fuelType is fuelTypeEnum.Benzine)
                {

                    if (this.kmPerLiter >= 25.0)
                    {
                        return energyClassEnum.A;
                    }
                    else if (this.kmPerLiter >= 25 && this.kmPerLiter >= 20.0)
                    {
                        return energyClassEnum.B;
                    }
                    else if (this.kmPerLiter >= 20 && this.kmPerLiter >= 15.0)
                    {
                        return energyClassEnum.C;
                    }
                    else if ( this.kmPerLiter >= 15)
                    {
                        return energyClassEnum.D;
                    }
                    else
                    {
                        throw new ArgumentOutOfRangeException();
                    }
                }
                else
                {
                    if (this.kmPerLiter >= 20.0)
                    {
                        return energyClassEnum.A;
                    }
                    else if (this.kmPerLiter < 20.0 && this.kmPerLiter >= 16.0)
                    {
                        return energyClassEnum.B;
                    }
                    else if (this.kmPerLiter < 16.0 && this.kmPerLiter >= 12.0)
                    {
                        return energyClassEnum.C;
                    }
                    else if (this.kmPerLiter < 12)
                    {
                        return energyClassEnum.D;
                    }
                    else
                    {
                        throw new ArgumentOutOfRangeException();
                    }
                }
            }

        }

        /// <summary>
        /// ToString (String.Format)
        /// </summary>
        public override string ToString()
        {
            return String.Format("{0}: {1}\n {2}: {3}\n {4}: {5}\n {6}: {7}\n {8}: {9}\n {10}: {11}\n {12}: {13}\n {14}: {15}\n {16}: {17}",
            nameof(this.Name),
                this.Name,
            nameof(this.Km),
                this.Km,
            nameof(this.RegistrationNumber),
                this.registrationNumber,
            nameof(this.Year),
                this.year,
            nameof(this.NewPrice),
                this.newPrice,
            nameof(this.EngineSize),
                this.engineSize,
            nameof(this.KmPerLiter),
                this.kmPerLiter,
            nameof(this.FuelType),
                this.fuelType,
            nameof(this.Energyclass),
                this.energyClass
                );
        }

        internal Auction Auction
        {
            get => default;
            set
            {
            }
        }
    }
}
