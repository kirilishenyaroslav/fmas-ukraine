unit TITaxInvoicesKorig_Loader;

interface
uses iBase,Classes,Windows,Forms,Controls,
     SysUtils,Variants,Dialogs,TITaxInvoicesKorig_Add, TICommonLoader,TiCommonTypes;

function View_TaxInvoicesKorig(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;id_vid_Nakl:Integer;id_vid_Nakl_Doc:Integer;id_Reestr:Integer;is_print:Integer):TTITaxInvoicesInfo;stdcall;
exports View_TaxInvoicesKorig;

implementation

function View_TaxInvoicesKorig(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;id_vid_Nakl:Integer;id_vid_Nakl_Doc:Integer;id_Reestr:Integer;is_print:Integer):TTITaxInvoicesInfo;
var ViewForm: TTaxInvoicesKorigAddForm;
begin
 if is_print = 0 then  //показ формы добавлени€/изменени€
   begin
     ViewForm := TTaxInvoicesKorigAddForm.Create(AOwner,DB_Handle,id_vid_Nakl,id_vid_Nakl_Doc,id_Reestr);
     if(ViewForm.ShowModal=mrOk)then
     begin
       Result:=ViewForm.Parameter;
     end;
   end;

 if is_print = 1 then  //печать отчета без изменений
   begin
     ViewForm := TTaxInvoicesKorigAddForm.Create(AOwner,DB_Handle,id_vid_Nakl,id_vid_Nakl_Doc,id_Reestr);
     ViewForm.DoPrint;
   end;

 if is_print = 2 then  //печать отчета с изменени€ми (декабрь 2011)  первый экземпл€р
  begin
    ViewForm := TTaxInvoicesKorigAddForm.Create(AOwner,DB_Handle,id_vid_Nakl,id_vid_Nakl_Doc,id_Reestr);
    ViewForm.DoPrintDecember;
  end;

  if is_print = 3 then  //печать отчета с изменени€ми (декабрь 2011)  первый экземпл€р
  begin
    ViewForm := TTaxInvoicesKorigAddForm.Create(AOwner,DB_Handle,id_vid_Nakl,id_vid_Nakl_Doc,id_Reestr);
    ViewForm.DoPrintDecemberTwoEkz;
  end;

  if is_print = 4 then  //печать отчета расчета корректировки
  begin
    ViewForm := TTaxInvoicesKorigAddForm.Create(AOwner,DB_Handle,id_vid_Nakl,id_vid_Nakl_Doc,id_Reestr);
    ViewForm.DoPrintKorig;
  end;

  if is_print = 5 then  //печать отчета расчета корректировки второй экземпл€р
  begin
    ViewForm := TTaxInvoicesKorigAddForm.Create(AOwner,DB_Handle,id_vid_Nakl,id_vid_Nakl_Doc,id_Reestr);
    ViewForm.DoPrintKorigTwoEkz;
  end;
end;

end.
