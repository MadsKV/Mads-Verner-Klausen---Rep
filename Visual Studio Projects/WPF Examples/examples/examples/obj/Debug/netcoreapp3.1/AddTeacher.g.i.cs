﻿#pragma checksum "..\..\..\AddTeacher.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "140F786AFB97F3FFE48400821DE2837978889DD8"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using examples;


namespace examples {
    
    
    /// <summary>
    /// AddTeacher
    /// </summary>
    public partial class AddTeacher : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 13 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image unlockedimg;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tFirstName;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tLastName;
        
        #line default
        #line hidden
        
        
        #line 21 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tAge;
        
        #line default
        #line hidden
        
        
        #line 23 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tMail;
        
        #line default
        #line hidden
        
        
        #line 28 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox selectClass;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button createTeacher;
        
        #line default
        #line hidden
        
        
        #line 32 "..\..\..\AddTeacher.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button back;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "5.0.4.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/examples;V1.0.0.0;component/addteacher.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\AddTeacher.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "5.0.4.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.unlockedimg = ((System.Windows.Controls.Image)(target));
            return;
            case 2:
            this.tFirstName = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.tLastName = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.tAge = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.tMail = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.selectClass = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 7:
            this.createTeacher = ((System.Windows.Controls.Button)(target));
            
            #line 29 "..\..\..\AddTeacher.xaml"
            this.createTeacher.Click += new System.Windows.RoutedEventHandler(this.createTeacher_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.back = ((System.Windows.Controls.Button)(target));
            
            #line 32 "..\..\..\AddTeacher.xaml"
            this.back.Click += new System.Windows.RoutedEventHandler(this.back_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

