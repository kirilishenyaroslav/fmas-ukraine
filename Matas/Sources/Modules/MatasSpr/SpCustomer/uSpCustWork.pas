{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpCustWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, Controls,
  Dialogs, DogLoaderUnit, StdCtrls, ibase, FIBDatabase, pFIBDatabase, GlobalSPR;

procedure ShowSpCustomers(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
function GetCustomers(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aFormStyle: TFormStyle; aActualDate:TDateTime; aSelectionMode: TCustomerSelectMode; aID_CUSTOMER: int64; aID_RATE_ACCOUNT: int64; aMultiSelect: boolean; aID_SESSION:integer):Variant;stdcall;
exports ShowSpCustomers, GetCustomers;

implementation

{
 1. В uses прописать модуль "DogLoaderUnit";
 2. В Requires пакета добавить LoadDog.dcp;
 3. В нужном месте написать следующее:
  var
   Res : Variant;
  begin
   Res := ShowCustomersSprav(Self, DBHandle, FormStyle, ActualDate, SelectionMode, id_customer, id_rate_account, isMultiSelect, id_session);
  end;

[III] Описание параметров вызова:
 Self          - родительская форма;
 DBHandle      - хэндл базы данных;
 FormStyle     - стиль формы(fsNormal, fsMDIChild);
 ActualDate    - актуальная дата(чаще всего равняется now);
 SelectionMode - режим выбора:
   * csmNone       - без выбора;
   * csmCustomers  - выбор контрагента;
   * csmRateAcc    - выбор счета;
   * csmContactMen - выбор лица;
   Примечание: данные константы находятся в пакете "Globals.bpl", модуль "GlobalSPR.pas".
 id_customer     - идентификатор контрагента, на который необходимо позиционироваться при открытии справочника;
 id_rate_account - идентификатор счета, на который необходимо позиционироваться при открытии справочника;
 isMultiSelect   - нужна ли возможность множественного выбора контрагентов(Используется при csmCustomers);
 }

procedure ShowSpCustomers(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64);stdcall;
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(DBHandle);
 i['FormStyle']    := fsMDIChild;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := SelNone;
 LoadSprav('Customer\CustPackage.bpl', aOwner, i, o);
 if o['ModalResult'] = mrOk then
 begin
  //  ShowSpravParams(aOwner, o);
 end;
 i.Free;
 o.Free;
// ShowCustomers(AOwner, DBHANDLE, fsMDIChild, Date, csmNone, 0, 0);
end;

function GetCustomers(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aFormStyle: TFormStyle; aActualDate:TDateTime; aSelectionMode: TCustomerSelectMode; aID_CUSTOMER: int64; aID_RATE_ACCOUNT: int64; aMultiSelect: boolean; aID_SESSION:integer):Variant;stdcall;
var
 Res : Variant;
 i, o : TSpravParams;
begin

//
// Res := ShowCustomers(aOwner, DBHandle, aFormStyle, aActualDate, aSelectionMode, aID_CUSTOMER, aID_RATE_ACCOUNT);
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(DBHandle);
 i['FormStyle']    := fsNormal;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := SelCustomer;
 LoadSprav('Customer\CustPackage.bpl', aOwner, i, o);
 if o['ModalResult'] = mrOk then
 begin
  Res := VarArrayCreate([0,2], varVariant);
  Res[0]:= o['ID_CUSTOMER'];
  Res[1]:= 0;
  Res[2]:= o['NAME_CUSTOMER'];
//id[0]  -идентификатор контрагента
//id[1]  -идентификатор вышестоящего органа управления
//id[2]  -наименование контрагента
 end;
 i.Free;
 o.Free;
 GetCustomers:=Res;

end;

end.
