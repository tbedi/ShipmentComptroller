﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34011
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PackingClassLibrary.DeleteRMAService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="DeleteRMAService.IDelete")]
    public interface IDelete {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDelete/ReturnDetailsallForeignKeyTables", ReplyAction="http://tempuri.org/IDelete/ReturnDetailsallForeignKeyTablesResponse")]
        bool ReturnDetailsallForeignKeyTables(System.Guid ReturnDetailID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDelete/ReasonCategoryByReasonID", ReplyAction="http://tempuri.org/IDelete/ReasonCategoryByReasonIDResponse")]
        bool ReasonCategoryByReasonID(System.Guid ReasonID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDelete/SKUReasonsByReturnDetailsID", ReplyAction="http://tempuri.org/IDelete/SKUReasonsByReturnDetailsIDResponse")]
        bool SKUReasonsByReturnDetailsID(System.Guid ReturnDetailID);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDelete/ReasonsByReasonID", ReplyAction="http://tempuri.org/IDelete/ReasonsByReasonIDResponse")]
        bool ReasonsByReasonID(System.Guid ReasonID);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IDeleteChannel : PackingClassLibrary.DeleteRMAService.IDelete, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class DeleteClient : System.ServiceModel.ClientBase<PackingClassLibrary.DeleteRMAService.IDelete>, PackingClassLibrary.DeleteRMAService.IDelete {
        
        public DeleteClient() {
        }
        
        public DeleteClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public DeleteClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DeleteClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DeleteClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public bool ReturnDetailsallForeignKeyTables(System.Guid ReturnDetailID) {
            return base.Channel.ReturnDetailsallForeignKeyTables(ReturnDetailID);
        }
        
        public bool ReasonCategoryByReasonID(System.Guid ReasonID) {
            return base.Channel.ReasonCategoryByReasonID(ReasonID);
        }
        
        public bool SKUReasonsByReturnDetailsID(System.Guid ReturnDetailID) {
            return base.Channel.SKUReasonsByReturnDetailsID(ReturnDetailID);
        }
        
        public bool ReasonsByReasonID(System.Guid ReasonID) {
            return base.Channel.ReasonsByReasonID(ReasonID);
        }
    }
}
