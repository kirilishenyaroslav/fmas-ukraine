unit uPRK_SP_SROK_OB;

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
  TFormPRK_SP_SROK_OB = class(TFormPrK_SpravOneLevel)
    colYEARS_KOLVO: TcxGridDBColumn;
    colMONTHES_KOLVO: TcxGridDBColumn;
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
  TDataPrKSpravSrokOb=class(TDataPrKSprav)
  private
    FYears_Kolvo: Smallint;
    FMonthes_Kolvo: Smallint;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp: Integer;
                       aYears_Kolvo :Smallint; aMonthes_Kolvo :Smallint);overload;
    procedure SetMonthes_Kolvo(const Value: Smallint);
    procedure SetYears_Kolvo(const Value: Smallint);
  public
    property Years_Kolvo   :Smallint read FYears_Kolvo write SetYears_Kolvo;
    property Monthes_Kolvo :Smallint read FMonthes_Kolvo write SetMonthes_Kolvo;
  end;

var
  FormPRK_SP_SROK_OB: TFormPRK_SP_SROK_OB;

implementation
uses uConstants,uPrKSpravEditSROK_OB;
{$R *.dfm}

procedure TFormPRK_SP_SROK_OB.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_SROK_OB';
  SelectSQLText        :='Select * from PRK_SP_SROK_OB_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_SROK_OB_ADD';
  StoredProcChangeName :='PRK_SP_SROK_OB_CHANGE';
  StoredProcDelName    :='PRK_SP_SROK_OB_DEL';

  InicFormCaption      :=nFormPRK_SP_SROK_OB_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_SROK_OB.InicCaption;
begin
  inherited;
   colYEARS_KOLVO.Caption    :=ncolYEARS_KOLVO[IndexLanguage];
   colMONTHES_KOLVO.Caption  :=ncolMONTHES_KOLVO[IndexLanguage];
end;

{ TDataPrKSpravSrokOb }

constructor TDataPrKSpravSrokOb.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  Years_Kolvo  :=0;
  Monthes_Kolvo:=0;
end;

constructor TDataPrKSpravSrokOb.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aYears_Kolvo,
  aMonthes_Kolvo: Smallint);
begin
   Create(aId, aName, aShortName,aKod,aNpp);
   Years_Kolvo  :=aYears_Kolvo;
   Monthes_Kolvo:=aMonthes_Kolvo;
end;

procedure TDataPrKSpravSrokOb.SetMonthes_Kolvo(const Value: Smallint);
begin
 case Value of
  0..12: FMonthes_Kolvo := Value;
  else   FMonthes_Kolvo := 0;
 end;
end;

procedure TDataPrKSpravSrokOb.SetYears_Kolvo(const Value: Smallint);
begin
 case Value of
  0..20: FYears_Kolvo := Value;
  else   FYears_Kolvo := 0;
 end;
end;

procedure TFormPRK_SP_SROK_OB.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravSrokOb;
   T:TFormPrKSpravEditSROK_OB;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravSrokOb.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                               StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrKSpravEditSROK_OB.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       StoredProcPrKSprav.ParamByName('NAME').AsString         :=DataPrKSpravAdd.Name;
       StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString   :=DataPrKSpravAdd.ShortName;
       StoredProcPrKSprav.ParamByName('KOD').AsInteger         :=DataPrKSpravAdd.Kod;
       StoredProcPrKSprav.ParamByName('NPP').AsInteger         :=DataPrKSpravAdd.Npp;
       StoredProcPrKSprav.ParamByName('YEARS_KOLVO').AsShort   :=DataPrKSpravAdd.Years_Kolvo;
       StoredProcPrKSprav.ParamByName('MONTHES_KOLVO').AsShort :=DataPrKSpravAdd.Monthes_Kolvo;
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

procedure TFormPRK_SP_SROK_OB.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravSrokOb;
   T:TFormPrKSpravEditSROK_OB;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravChange:=TDataPrKSpravSrokOb.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['YEARS_KOLVO'],
                                              DataSetPrKSprav.FieldValues['MONTHES_KOLVO']);

       T:=TFormPrKSpravEditSROK_OB.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           StoredProcPrKSprav.ParamByName('YEARS_KOLVO').AsShort   :=DataPrKSpravChange.Years_Kolvo;
           StoredProcPrKSprav.ParamByName('MONTHES_KOLVO').AsShort :=DataPrKSpravChange.Monthes_Kolvo;
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

procedure TFormPRK_SP_SROK_OB.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravSrokOb;
   T:TFormPrKSpravEditSROK_OB;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravView:=TDataPrKSpravSrokOb.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['YEARS_KOLVO'],
                                              DataSetPrKSprav.FieldValues['MONTHES_KOLVO']);

       T:=TFormPrKSpravEditSROK_OB.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
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
       T.cxSpinEditYearsKolvo.Properties.ReadOnly    :=true;
       T.cxSpinEditMonthesKolvo.Properties.ReadOnly  :=true;
       T.cxTextEditName.Style.Color      :=TextViewColor;
       T.cxTextEditShortName.Style.Color :=TextViewColor;
       T.cxTextEditKod.Style.Color       :=TextViewColor;
       T.cxTextEditNpp.Style.Color       :=TextViewColor;
       T.cxSpinEditYearsKolvo.Style.Color   :=TextViewColor;
       T.cxSpinEditMonthesKolvo.Style.Color :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;
end;

procedure TFormPRK_SP_SROK_OB.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,7], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    ResultArray[5] :=DataSetPrKSprav.FieldValues['YEARS_KOLVO'];
    ResultArray[6] :=DataSetPrKSprav.FieldValues['MONTHES_KOLVO'];
    close;
  end;
end;

end.
