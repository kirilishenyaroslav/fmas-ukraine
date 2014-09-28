unit UPkvIntf;

interface

uses AppStruClasses, PkvMain, Ibase, Forms, Classes, Variants, Controls,
     Messages, pFibDataSet;

type
     TSmPkvModule=class(TFMASAppModule,IFMASModule)
     private
           WorkMainForm:TForm;
           ResultValue :Variant;
           id_pkv      :integer;
     public
           procedure Run;
           procedure OnLanguageChange(var Msg:TMessage); message FMAS_MESS_CHANGE_LANG;
           procedure OnGridStylesChange(var Msg:TMessage); message FMAS_MESS_CHANGE_GSTYLE;
           destructor Destroy;
     end;



function GetSmPKV(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;ID_FOR_LOCATION:Integer):Variant;stdcall;
exports GetSmPKV;

implementation


function GetSmPKV(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;ID_FOR_LOCATION:Integer):Variant;
var  f:Boolean;
     i:Integer;
     T:TfrmSmPkvMain;
     Res:Variant;
begin
       Res:=NULL;
       if fs=fsNormal
       then begin
            T:=TfrmSmPkvMain.Create(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION);
            T.ToolButton3.Visible:=true;
            if T.ShowModal=mrYes
            then begin
                      Res:=T.ResultValue;
            end;
            T.Free;
       end
       else begin
            f :=true;
            for i:=0 to Application.MainForm.MDIChildCount-1 do
            begin
                 if (Application.MainForm.MDIChildren[i] is TfrmSmPkvMain)
                 then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
                 end;
            end;
            if f then TfrmSmPkvMain.Create(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION);
       end;
       Result:=Res;
end;


{ TSmPkvModule }

destructor TSmPkvModule.Destroy;
begin
     if Assigned(self.WorkMainForm) then self.WorkMainForm.Free;
end;

procedure TSmPkvModule.OnGridStylesChange(var Msg: TMessage);
begin
     //для будущей реализации
end;

procedure TSmPkvModule.OnLanguageChange(var Msg: TMessage);
begin
     //для будущей реализации
end;

procedure TSmPkvModule.Run;
var
     f:Boolean;
     ID_FOR_LOCATION,fs,i:Integer;
     AOwner:TComponent;
     DB_HANDLE:TISC_DB_HANDLE;
     GetInfoDS:TpFibDataSet;
begin
     self.ResultValue:=NULL;

     //Получаем входящие параметры
     FS             :=PInteger(self.InParams.items['FS'])^;
     DB_HANDLE      :=TISC_DB_HANDLE(PInteger(self.InParams.Items['DB_HANDLE'])^);
     AOwner         :=TComponent(self.InParams.items['AOwner']^);
     ID_FOR_LOCATION:=PInteger(self.InParams.Items['ID_FOR_LOCATION'])^;

     //Бизнес-логика
     if fs=0
     then begin
                WorkMainForm:=TfrmSmPkvMain.Create(AOwner,DB_HANDLE,fsNormal,ID_FOR_LOCATION);
                TfrmSmPkvMain(WorkMainForm).ToolButton3.Visible:=true;
                if TfrmSmPkvMain(WorkMainForm).ShowModal=mrYes
                then begin
                           self.ResultValue:=TfrmSmPkvMain(WorkMainForm).ResultValue;
                           {self.id_pkv     :=VarAsType(self.ResultValue,varInt64);
                           GetInfoDS:=TpFibDataSet.Create(self);
                           GetInfoDS.Database:=TfrmGetFactRsx(Owner).WorkDatabase;
                           GetInfoDS.Transaction:=TfrmGetFactRsx(Owner).ReadTransaction;
                           GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_sp_sm_pkv WHERE ID_PKV='+IntToStr(id_pkv);
                           GetInfoDS.Open;
                           if (GetInfoDS.RecordCount>0)
                           then begin
                                     pkv_kod  :=GetInfoDS.FieldByName('PKV_KOD').AsString;
                                     pkv_title:=GetInfoDS.FieldByName('PKV_TITLE').AsString;
                                     cxButtonEdit3.Text:=pkv_kod+' "'+pkv_title+'"';
                           end;
                           GetInfoDS.Close;
                           GetInfoDS.Free;}
                end;
                TfrmSmPkvMain(WorkMainForm).Free;
     end
     else begin
                f :=true;
                for i:=0 to Application.MainForm.MDIChildCount-1 do
                begin
                     if (Application.MainForm.MDIChildren[i] is TfrmSmPkvMain)
                     then begin
                               Application.MainForm.MDIChildren[i].BringToFront;
                               f:=false;
                     end;
                end;
                if f then TfrmSmPkvMain.Create(AOwner,DB_HANDLE,fsMdiChild,ID_FOR_LOCATION);
       end;
       self.OutParams.Items['Result']:=PVariant(@self.ResultValue);
end;


initialization
      //Регистрация класса в глобальном реестре
      RegisterAppModule(TSmPkvModule,'smpkvintf');


end.
