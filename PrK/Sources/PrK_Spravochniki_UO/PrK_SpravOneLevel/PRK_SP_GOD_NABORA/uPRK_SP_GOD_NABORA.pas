unit uPRK_SP_GOD_NABORA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar,uPrK_Resources;

type
  TFormPRK_SP_GOD_NABORA = class(TFormPrK_SpravOneLevel)
    colDATE_BEGIN: TcxGridDBColumn;
    colDATE_END: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
  private
    procedure InicCaption;override;
  public
    { Public declarations }
  end;

type
  TDataPrKSpravGodNabora=class(TDataPrKSprav)
  private
    FDateBeg: TDate;
    FDateEnd: TDate;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp: Integer;
                       aDateBeg :TDate; aDateEnd :TDate);overload;
    procedure SetDateBeg(const Value: TDate);
    procedure SetDateEnd(const Value: TDate);
  public
    property DateBeg :TDate read FDateBeg write SetDateBeg;
    property DateEnd :TDate read FDateEnd write SetDateEnd;
  end;

var
  FormPRK_SP_GOD_NABORA: TFormPRK_SP_GOD_NABORA;

implementation
uses uConstants,uPrKSpravEditGOD_NABORA;
{$R *.dfm}

procedure TFormPRK_SP_GOD_NABORA.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_GOD_NABORA';
  SelectSQLText        :='Select * from PRK_SP_GOD_NABORA_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_GOD_NABORA_ADD';
  StoredProcChangeName :='PRK_SP_GOD_NABORA_CHANGE';
  StoredProcDelName    :='PRK_PRK_SP_GOD_NABORA_DEL';
{  NamePrKSpravEdit     := PrKSpravEditFobProt;// возможно это не надо будет }

  InicFormCaption      :=nFormPRK_SP_GOD_NABORA_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_GOD_NABORA.InicCaption;
begin
  inherited;
   colDATE_BEGIN.Caption  :=ncolDATE_BEGIN[IndexLanguage];
   colDATE_END.Caption    :=ncolDATE_END[IndexLanguage];
end;

procedure TFormPRK_SP_GOD_NABORA.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravGodNabora;
   T:TFormPrKSpravEditGOD_NABORA;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravGodNabora.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                                  StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrKSpravEditGOD_NABORA.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage];
   if ShowNpp=true then
    begin
      T.cxLabelNPP.Visible    :=true;
      T.cxTextEditNPP.Visible :=true;
    end;
   if T.ShowModal=MrOk then
    begin
       StoredProcPrKSprav.Transaction.StartTransaction;
       StoredProcPrKSprav.StoredProcName:=StoredProcAddName;
       StoredProcPrKSprav.Prepare;
       StoredProcPrKSprav.ParamByName('NAME').AsString        :=DataPrKSpravAdd.Name;
       StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString  :=DataPrKSpravAdd.ShortName;
       StoredProcPrKSprav.ParamByName('KOD').AsInteger        :=DataPrKSpravAdd.Kod;
       StoredProcPrKSprav.ParamByName('NPP').AsInteger        :=DataPrKSpravAdd.Npp;
       StoredProcPrKSprav.ParamByName('DATE_BEGIN').AsDate    :=DataPrKSpravAdd.DateBeg;
       StoredProcPrKSprav.ParamByName('DATE_END').AsDate      :=DataPrKSpravAdd.DateEnd;
       try
          StoredProcPrKSprav.ExecProc;
          StoredProcPrKSprav.Transaction.commit;
          DataPrKSpravAdd.Id:=StoredProcPrKSprav.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
             StoredProcPrKSprav.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataPrKSpravAdd.Id);
   DataPrKSpravAdd.Free;
   DataPrKSpravAdd:=nil;
   if TryAgain=true
      then ActionADDExecute(Sender);
end;

procedure TFormPRK_SP_GOD_NABORA.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravGodNabora;
   T:TFormPrKSpravEditGOD_NABORA;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravChange:=TDataPrKSpravGodNabora.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['DATE_BEGIN'],
                                              DataSetPrKSprav.FieldValues['DATE_END']);

       T:=TFormPrKSpravEditGOD_NABORA.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndexLanguage];
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       if T.ShowModal=MrOk then
        begin
           StoredProcPrKSprav.Transaction.StartTransaction;
           StoredProcPrKSprav.StoredProcName:=StoredProcChangeName;
           StoredProcPrKSprav.Prepare;
           StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64         :=DataPrKSpravChange.Id;
           StoredProcPrKSprav.ParamByName('NAME').AsString         :=DataPrKSpravChange.Name;
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString   :=DataPrKSpravChange.ShortName;
           StoredProcPrKSprav.ParamByName('KOD').AsInteger         :=DataPrKSpravChange.Kod;
           StoredProcPrKSprav.ParamByName('NPP').AsInteger         :=DataPrKSpravChange.Npp;
           StoredProcPrKSprav.ParamByName('DATE_BEGIN').AsDate     :=DataPrKSpravChange.DateBeg;
           StoredProcPrKSprav.ParamByName('DATE_END').AsDate       :=DataPrKSpravChange.DateEnd;
           try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
       Obnovit(DataPrKSpravChange.Id);
       DataPrKSpravChange.Free;
       DataPrKSpravChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeExecute(sender);
end;

procedure TFormPRK_SP_GOD_NABORA.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravGodNabora;
   T:TFormPrKSpravEditGOD_NABORA;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravView:=TDataPrKSpravGodNabora.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['DATE_BEGIN'],
                                              DataSetPrKSprav.FieldValues['DATE_END']);

       T:=TFormPrKSpravEditGOD_NABORA.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage];
       T.cxTextEditName.Properties.ReadOnly      :=true;
       T.cxTextEditShortName.Properties.ReadOnly :=true;
       T.cxTextEditKod.Properties.ReadOnly       :=true;
       T.cxTextEditNpp.Properties.ReadOnly       :=true;
       T.cxDateEditDateBeg.Properties.ReadOnly       :=true;
       T.cxDateEditDateEnd.Properties.ReadOnly       :=true;
       T.cxTextEditName.Style.Color      :=TextViewColor;
       T.cxTextEditShortName.Style.Color :=TextViewColor;
       T.cxTextEditKod.Style.Color       :=TextViewColor;
       T.cxTextEditNpp.Style.Color       :=TextViewColor;
       T.cxDateEditDateBeg.Style.Color       :=TextViewColor;
       T.cxDateEditDateEnd.Style.Color       :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;
end;

procedure TFormPRK_SP_GOD_NABORA.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,6], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    ResultArray[5] :=DataSetPrKSprav.FieldValues['DATE_BEGIN'];
    ResultArray[6] :=DataSetPrKSprav.FieldValues['DATE_END'];
    close;
  end;
end;



{ TDataPrKSpravGodNabora }

constructor TDataPrKSpravGodNabora.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aDateBeg, aDateEnd: TDate);
begin
   Create(aId, aName, aShortName,aKod,aNpp);
   DateBeg:=aDateBeg;
   DateEnd:=aDateEnd;
end;

constructor TDataPrKSpravGodNabora.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  DateBeg:=now;
  DateEnd:=now;
end;

procedure TDataPrKSpravGodNabora.SetDateBeg(const Value: TDate);
begin
  FDateBeg := Value;
end;

procedure TDataPrKSpravGodNabora.SetDateEnd(const Value: TDate);
begin
  FDateEnd := Value;
end;

end.
