unit MBOOK_fmProvInfo_intf;

interface
     uses MBOOK_fmProvInfo,AppStruClasses, Forms, Classes, Ibase, Messages, Windows,
     Dialogs, SysUtils,Variants ;


type
     TMBOOK_fmProvInfo = class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
     public
           procedure  Run;
           procedure  OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure  OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           destructor Destroy; override;
     end;


implementation

{ TMBOOK_fmProvInfo }

destructor TMBOOK_fmProvInfo.Destroy;
begin
     if Assigned(self.WorkMainForm) then self.WorkMainForm.Free;
     inherited Destroy;
end;

procedure TMBOOK_fmProvInfo.OnGridStylesChange(var Msg: TMessage);
begin

end;

procedure TMBOOK_fmProvInfo.OnLanguageChange(var Msg: TMessage);
begin
    TfmProvInfo(WorkMainForm).SetLanguage(Msg.WParam);
    Language:=Msg.WParam;
end;

procedure TMBOOK_fmProvInfo.Run;
begin
     WorkMainForm := TfmProvInfo.Create(
     TComponent(Pointer(self.InParams.Items['AOwner'])^),
     TISC_DB_HANDLE(PInteger(self.InParams.Items['AhConnection'])^),
     PInt64(self.InParams.Items['AD_ID_SCH'])^,
     PInt64(self.InParams.Items['AK_ID_SCH'])^,
     PInt64(self.InParams.Items['AD_ID_SMETA'])^,
     PInt64(self.InParams.Items['AD_ID_RAZDEL'])^,
     PInt64(self.InParams.Items['AD_ID_STAT'])^,
     PInt64(self.InParams.Items['AD_ID_KEKV'])^,
     PInteger(self.InParams.Items['AD_OR_K_OBOROT'])^,
     PDateTime(self.InParams.Items['ADate_Beg'])^,
     PDateTime(self.InParams.Items['ADate_End'])^,
     PInteger(self.InParams.Items['AId_Lang'])^);
     TfmProvInfo(WorkMainForm).SetLanguage(PInteger(self.InParams.Items['AId_Lang'])^);
     WorkMainForm.ShowModal;
     WorkMainForm.Free;
end;


 initialization
      RegisterAppModule(TMBOOK_fmProvInfo,'obranalize_ex');


end.
