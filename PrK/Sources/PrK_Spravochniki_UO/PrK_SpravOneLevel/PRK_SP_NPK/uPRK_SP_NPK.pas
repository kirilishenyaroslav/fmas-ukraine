unit uPRK_SP_NPK;

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
  TFormPRK_SP_NPK = class(TFormPrK_SpravOneLevel)
    colSP_SOSTAV_PK: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
  private
    { Private declarations }
  public
    ID_USER_GLOBAL,ID_GOD_NABORA_GLOBAL : int64
  end;

  type
  TDataPrKSpravNPK=class(TDataPrKSprav)
  private
    FID_SP_SOSTAV_PK: int64;
    FFIO: string;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp : Integer;
                       aID_SP_SOSTAV_PK  : int64;
                       aFIO              : string);overload;
    procedure SetFIO(const Value: string);
    procedure SetID_SP_SOSTAV_PK(const Value: int64);
  public
    property ID_SP_SOSTAV_PK :int64 read FID_SP_SOSTAV_PK write SetID_SP_SOSTAV_PK;
    property FIO :string read FFIO write SetFIO;
  end;

var
  FormPRK_SP_NPK: TFormPRK_SP_NPK;

implementation
uses uConstants,uPRK_SP_NPK_Edit;
{$R *.dfm}

procedure TFormPRK_SP_NPK.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_NPK';
  SelectSQLText        :='Select * from PRK_SP_NPK_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_NPK_ADD';
  StoredProcChangeName :='PRK_SP_NPK_CHANGE';
  StoredProcDelName    :='PRK_SP_NPK_DEL';
  NamePrKSpravEdit     := PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_NPK_Caption[IndexLanguage];
  colSP_SOSTAV_PK.Caption:=ncolZamestitel[IndexLanguage];
  // ??? ID_USER_GLOBAL       :=ParamSprav['Input']['ID_USER_GLOBAL'].AsInt64;
  // ??? ID_GOD_NABORA_GLOBAL :=ParamSprav['Input']['God_Nabora'].AsInt64;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

{ TDataPrKSpravNPK }

constructor TDataPrKSpravNPK.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aID_SP_SOSTAV_PK: int64;
  aFIO: string);
begin
  Create(aId, aName, aShortName,aKod,aNpp);
  ID_SP_SOSTAV_PK    :=aID_SP_SOSTAV_PK;
  FIO :=aFIO;
end;

constructor TDataPrKSpravNPK.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  ID_SP_SOSTAV_PK :=-1;
  FIO             :='';
end;

procedure TDataPrKSpravNPK.SetFIO(const Value: string);
begin
  FFIO := Value;
end;

procedure TDataPrKSpravNPK.SetID_SP_SOSTAV_PK(const Value: int64);
begin
  FID_SP_SOSTAV_PK := Value;
end;

procedure TFormPRK_SP_NPK.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravNPK;
   T:TFormPrK_SP_NPK_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravNPK.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                            StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrK_SP_NPK_Edit.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       StoredProcPrKSprav.ParamByName('NAME').AsString                  :=DataPrKSpravAdd.Name;
       StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString            :=DataPrKSpravAdd.ShortName;
       StoredProcPrKSprav.ParamByName('KOD').AsInteger                  :=DataPrKSpravAdd.Kod;
       StoredProcPrKSprav.ParamByName('NPP').AsInteger                  :=DataPrKSpravAdd.Npp;
       StoredProcPrKSprav.ParamByName('ID_SP_SOSTAV_PK').AsInt64        :=DataPrKSpravAdd.ID_SP_SOSTAV_PK;
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

procedure TFormPRK_SP_NPK.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravNPK;
   T:TFormPrK_SP_NPK_Edit;
   TryAgain :boolean;
   ID_SP_SOSTAV_PK_loc:Int64;
   FIO_loc :String;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_SOSTAV_PK']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_SOSTAV_PK']=-1)
        then begin
          ID_SP_SOSTAV_PK_loc := -1;
          FIO_loc             := '';
        end
        else begin
          ID_SP_SOSTAV_PK_loc := DataSetPrKSprav.FieldValues['ID_SP_SOSTAV_PK'];
          FIO_loc             := DataSetPrKSprav.FieldValues['FIO'];
        end;

       DataPrKSpravChange:=TDataPrKSpravNPK.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_SOSTAV_PK_loc,
                                              FIO_loc);

       T:=TFormPrK_SP_NPK_Edit.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64                  :=DataPrKSpravChange.Id;
           StoredProcPrKSprav.ParamByName('NAME').AsString                  :=DataPrKSpravChange.Name;
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString            :=DataPrKSpravChange.ShortName;
           StoredProcPrKSprav.ParamByName('KOD').AsInteger                  :=DataPrKSpravChange.Kod;
           StoredProcPrKSprav.ParamByName('NPP').AsInteger                  :=DataPrKSpravChange.Npp;
           StoredProcPrKSprav.ParamByName('ID_SP_SOSTAV_PK').AsInt64        :=DataPrKSpravChange.ID_SP_SOSTAV_PK;
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

procedure TFormPRK_SP_NPK.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravNPK;
   T:TFormPrK_SP_NPK_Edit;
   ID_SP_SOSTAV_PK_loc:Int64;
   FIO_loc :String;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_SOSTAV_PK']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_SOSTAV_PK']=-1)
        then begin
          ID_SP_SOSTAV_PK_loc := -1;
          FIO_loc             := '';
        end
        else begin
          ID_SP_SOSTAV_PK_loc := DataSetPrKSprav.FieldValues['ID_SP_SOSTAV_PK'];
          FIO_loc             := DataSetPrKSprav.FieldValues['FIO'];
        end;

       DataPrKSpravView:=TDataPrKSpravNPK.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_SOSTAV_PK_loc,
                                              FIO_loc);

       T:=TFormPrK_SP_NPK_Edit.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage];
       T.cxButtonEditSostavPK.Properties.ReadOnly      :=true;
       T.cxButtonEditSostavPK.Properties.Buttons[0].Visible:=false;

       T.cxTextEditName.Properties.ReadOnly          :=true;
       T.cxTextEditShortName.Properties.ReadOnly     :=true;
       T.cxTextEditKod.Properties.ReadOnly           :=true;
       T.cxTextEditNpp.Properties.ReadOnly           :=true;

       T.cxButtonEditSostavPK.Style.Color      :=TextViewColor;
       T.cxTextEditName.Style.Color          :=TextViewColor;
       T.cxTextEditShortName.Style.Color     :=TextViewColor;
       T.cxTextEditKod.Style.Color           :=TextViewColor;
       T.cxTextEditNpp.Style.Color           :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;
end;

end.
