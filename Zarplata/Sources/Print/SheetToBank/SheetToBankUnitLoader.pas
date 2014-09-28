unit SheetToBankUnitLoader;

interface
uses Classes, IBase, SheetToBankDataModul, Controls, Forms, SysUtils,DateUtils,
     Windows, Dialogs, Variants,ZSvodTypesUnit, SheetToBankSort, SheetToBankAllSort,
     SheetToBankAllDataModul, Dates;

function ReportSheetToBank(AParam:TSheetToBankParameter):variant;stdcall;
exports ReportSheetToBank;

function ReportSheetAllToBank(AParam:TSheetToBankAllParameter):variant;stdcall;
exports ReportSheetAllToBank;

implementation

uses Math , pFIBQuery, FIBQuery;

function ReportSheetToBank(AParam:TSheetToBankParameter):variant;stdcall;
var ReportSpr:TDM;
    Sort:TFSort;
    Param:TSheetToBankParameter;
    DatePr:TDate;
begin
  Param:=AParam;
  sort :=TFSort.Create(Param.Owner,Param.DB_Handle);
  sort.id_reestr:=param.Id_reestr;
  sort.BankEdit.Text:=Param.type_payment;
  sort.pNameBank:=Param.type_payment;
  Sort.PId_Type_Payment:=Param.id_type_payment;
  if sort.ShowModal<>mrYes then
   begin
    DatePr:=Sort.EditDate.Date;
    Sort.Destroy;
    Exit;
   end;
  ReportSpr := TDM.Create(Param.Owner);
  ReportSpr.Bank:=Sort.Bank;
  ReportSpr.NameBank := Sort.BankName;
  if Sort.RadioGroupOrder.ItemIndex=0 then ReportSpr.OrderBy:='order by tn'
  else ReportSpr.OrderBy:='order by fio';
  Sort.Destroy;
  ReportSpr.PrintSpr(Param);
  ReportSpr.Free;
end;

function ReportSheetAllToBank(AParam:TSheetToBankAllParameter):variant;stdcall;
var ReportSpr:TDMAll;
    Sort:TForm;
    Param:TSheetToBankAllParameter;
begin
  Param:=AParam;
  ReportSpr := TDMAll.Create(Param.Owner);

  if AParam.Id_session=0 then
   begin
    sort :=TFAllSort.Create(Param.Owner,Param.DB_Handle);
    with Sort as TFAllSort do
     begin
      if sort.ShowModal<>mrYes then
       begin
        Sort.Destroy;
        Exit;
       end;
      ReportSpr.Bank:=Bank;
      if RadioGroupOrder.ItemIndex=0 then ReportSpr.OrderBy:='order by tn'
      else ReportSpr.OrderBy:='order by fio';
      ReportSpr.KodSetup := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1)
     end;
   end
  else
   begin
    sort :=TFSort.Create(Param.Owner,Param.DB_Handle);
    with Sort as TFSort do
     begin
      SetSession(AParam.Id_session);
      if sort.ShowModal<>mrYes then
       begin
        Sort.Destroy;
        Exit;
       end;
      ReportSpr.Bank:=Bank;
      if RadioGroupOrder.ItemIndex=0 then ReportSpr.OrderBy:='order by tn'
      else ReportSpr.OrderBy:='order by fio';
      reportSpr.KodSetup:=0;
     end;
   end;

  Sort.Destroy;
  ReportSpr.PrintSpr(Param);
  Result:=ReportSpr.Printed;
  ReportSpr.Free;
end;

end.
