unit uPRK_SP_TYPE_DOP_DOK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar,uPrK_Resources,
  cxCheckBox;

type
  TFormPRK_SP_TYPE_DOP_DOK = class(TFormPrK_SpravOneLevel)
    colNAME_VEDOM_TYPE: TcxGridDBColumn;
    colIS_OCENKA: TcxGridDBColumn;
    colNAME_PREDM: TcxGridDBColumn;
    colIS_NO_ROZPISKA: TcxGridDBColumn;
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
  TDataPrKSpravDOP_DOK=class(TDataPrKSprav)
  private
    FIdSpIspitVedomType: int64;
    FIsOcenka: Smallint;
    FShortNameVedomType: string;
    FIdSpPredm: int64;
    FShortNamePredm: string;
    FIsNoRozpiska: Integer;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp: Integer;
                       aIdSpIspitVedomType :int64;
                       aShortNameVedomType :string;
                       aIdSpPredm          :int64;
                       aShortNamePredm     :string;
                       aIsOcenka           :Smallint;
                       aIsNoRozpiska       :Integer);overload;
    procedure SetIdSpIspitVedomType(const Value: int64);
    procedure SetIsOcenka(const Value: Smallint);
    procedure SetShortNameVedomType(const Value: string);
    procedure SetIdSpPredm(const Value: int64);
    procedure SetShortNamePredm(const Value: string);
    procedure SetIsNoRozpiska(const Value: Integer);
  public
    property IdSpIspitVedomType :int64 read FIdSpIspitVedomType write SetIdSpIspitVedomType;
    property ShortNameVedomType :string read FShortNameVedomType write SetShortNameVedomType;
    property IdSpPredm          :int64 read FIdSpPredm write SetIdSpPredm;
    property ShortNamePredm     :string read FShortNamePredm write SetShortNamePredm;
    property IsOcenka           :Smallint read FIsOcenka write SetIsOcenka;
    property IsNoRozpiska       :Integer read FIsNoRozpiska write SetIsNoRozpiska;
  end;

var
  FormPRK_SP_TYPE_DOP_DOK: TFormPRK_SP_TYPE_DOP_DOK;

implementation
uses uConstants,uPrKSpravEditTYPE_DOP_DOK, uPrKKlassSprav,
     AArray ;
{$R *.dfm}

procedure TFormPRK_SP_TYPE_DOP_DOK.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_TYPE_DOP_DOK';
  SelectSQLText        :='Select * from PRK_SP_TYPE_DOP_DOK_SELECT('+IntTostr(ParamSprav['Input']['ID_CN_SP_FORM_STUD'].AsInt64)+','
                        +IntTostr(ParamSprav['Input']['ID_CN_SP_KAT_STUD'].AsInt64)+','+IntTostr(ParamSprav['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64)+')';

  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_TYPE_DOP_DOK_ADD';
  StoredProcChangeName :='PRK_SP_TYPE_DOP_DOK_CHANGE';
  StoredProcDelName    :='PRK_SP_TYPE_DOP_DOK_DEL';

  InicFormCaption      :=nFormPRK_SP_TYPE_DOP_DOK_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_TYPE_DOP_DOK.InicCaption;
begin
  inherited;
  colNAME_VEDOM_TYPE.Caption   :=ncolNAME_VEDOM_TYPE[IndexLanguage];
  colIS_OCENKA.Caption         :=ncolIS_OCENKA_Vedom[IndexLanguage];
  colNAME_PREDM.Caption        :=ncolPREDM[IndexLanguage];
  colIS_NO_ROZPISKA.Caption    :=ncolIS_NO_ROZPISKA[IndexLanguage];
end;

{ TDataPrKSpravDOP_DOK }

constructor TDataPrKSpravDOP_DOK.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aIdSpIspitVedomType: int64;
  aShortNameVedomType: string; aIdSpPredm :int64; aShortNamePredm :string;
  aIsOcenka: Smallint;aIsNoRozpiska       :Integer);
begin
  Create(aId, aName, aShortName,aKod,aNpp);
  IdSpIspitVedomType    :=aIdSpIspitVedomType;
  ShortNameVedomType    :=aShortNameVedomType;
  IdSpPredm             :=aIdSpPredm;
  ShortNamePredm        :=aShortNamePredm;
  IsOcenka              :=aIsOcenka;
  IsNoRozpiska          :=aIsNoRozpiska;
end;

constructor TDataPrKSpravDOP_DOK.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  IdSpIspitVedomType :=-1;
  ShortNameVedomType :='';
  IdSpPredm          :=-1;
  ShortNamePredm     :='';
  IsOcenka           :=0;
  IsNoRozpiska       :=0;
end;

procedure TDataPrKSpravDOP_DOK.SetIdSpIspitVedomType(const Value: int64);
begin
  FIdSpIspitVedomType := Value;
end;

procedure TDataPrKSpravDOP_DOK.SetIdSpPredm(const Value: int64);
begin
  FIdSpPredm := Value;
end;

procedure TDataPrKSpravDOP_DOK.SetIsNoRozpiska(const Value: Integer);
begin
  FIsNoRozpiska := Value;
end;

procedure TDataPrKSpravDOP_DOK.SetIsOcenka(const Value: Smallint);
begin
  FIsOcenka := Value;
end;

procedure TDataPrKSpravDOP_DOK.SetShortNamePredm(const Value: string);
begin
  FShortNamePredm := Value;
end;

procedure TDataPrKSpravDOP_DOK.SetShortNameVedomType(const Value: string);
begin
  FShortNameVedomType := Value;
end;

procedure TFormPRK_SP_TYPE_DOP_DOK.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravDOP_DOK;
   T:TFormPrKSpravEditTYPE_DOP_DOK;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravDOP_DOK.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                                StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrKSpravEditTYPE_DOP_DOK.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       if DataPrKSpravAdd.IsOcenka=1
          then  begin
            StoredProcPrKSprav.ParamByName('ID_SP_ISPIT_VEDOM_TYPE').AsInt64 :=DataPrKSpravAdd.IdSpIspitVedomType;
            StoredProcPrKSprav.ParamByName('ID_SP_PREDM').AsInt64            :=DataPrKSpravAdd.IdSpPredm;
          end
          else begin
           StoredProcPrKSprav.ParamByName('ID_SP_ISPIT_VEDOM_TYPE').AsInt64  :=-1;
           StoredProcPrKSprav.ParamByName('ID_SP_PREDM').AsInt64             :=-1;
          end;
       StoredProcPrKSprav.ParamByName('ID_SP_PREDM').AsInt64            :=DataPrKSpravAdd.IdSpPredm;
       StoredProcPrKSprav.ParamByName('IS_OCENKA').AsShort              :=DataPrKSpravAdd.IsOcenka;
       StoredProcPrKSprav.ParamByName('IS_NO_ROZPISKA').AsInteger       :=DataPrKSpravAdd.IsNoRozpiska;
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

procedure TFormPRK_SP_TYPE_DOP_DOK.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravDOP_DOK;
   T:TFormPrKSpravEditTYPE_DOP_DOK;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravChange:=TDataPrKSpravDOP_DOK.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              StrToInt64(DataSetPrKSprav.FieldValues['ID_SP_ISPIT_VEDOM_TYPE']),
                                              DataSetPrKSprav.FieldValues['SHORT_NAME_VEDOM_TYPE'],
                                              StrToInt64(DataSetPrKSprav.FieldValues['ID_SP_PREDM']),
                                              DataSetPrKSprav.FieldValues['SHORT_NAME_PREDM'],
                                              StrToInt(DataSetPrKSprav.FieldValues['IS_OCENKA']),
                                              StrToInt(DataSetPrKSprav.FieldValues['IS_NO_ROZPISKA']));

       T:=TFormPrKSpravEditTYPE_DOP_DOK.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           if DataPrKSpravChange.IsOcenka=1
            then  begin
              StoredProcPrKSprav.ParamByName('ID_SP_ISPIT_VEDOM_TYPE').AsInt64 :=DataPrKSpravChange.IdSpIspitVedomType;
              StoredProcPrKSprav.ParamByName('ID_SP_PREDM').AsInt64            :=DataPrKSpravChange.IdSpPredm;
            end
            else begin
             StoredProcPrKSprav.ParamByName('ID_SP_ISPIT_VEDOM_TYPE').AsInt64  :=-1;
             StoredProcPrKSprav.ParamByName('ID_SP_PREDM').AsInt64             :=-1;
            end;
           StoredProcPrKSprav.ParamByName('ID_SP_PREDM').AsInt64            :=DataPrKSpravChange.IdSpPredm;
           StoredProcPrKSprav.ParamByName('IS_OCENKA').AsShort              :=DataPrKSpravChange.IsOcenka;
           StoredProcPrKSprav.ParamByName('IS_NO_ROZPISKA').AsInteger       :=DataPrKSpravChange.IsNoRozpiska;
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

procedure TFormPRK_SP_TYPE_DOP_DOK.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravDOP_DOK;
   T:TFormPrKSpravEditTYPE_DOP_DOK;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravView:=TDataPrKSpravDOP_DOK.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              StrToInt64(DataSetPrKSprav.FieldValues['ID_SP_ISPIT_VEDOM_TYPE']),
                                              DataSetPrKSprav.FieldValues['SHORT_NAME_VEDOM_TYPE'],
                                              StrToInt64(DataSetPrKSprav.FieldValues['ID_SP_PREDM']),
                                              DataSetPrKSprav.FieldValues['SHORT_NAME_PREDM'],
                                              StrToInt(DataSetPrKSprav.FieldValues['IS_OCENKA']),
                                              StrToInt(DataSetPrKSprav.FieldValues['IS_NO_ROZPISKA']));

       T:=TFormPrKSpravEditTYPE_DOP_DOK.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage];
       T.cxButtonEditISPIT_VEDOM_TYPE.Properties.ReadOnly      :=true;
       T.cxButtonEditISPIT_VEDOM_TYPE.Properties.Buttons[0].Visible:=false;
       T.cxButtonEditPredm.Properties.ReadOnly                 :=true;
       T.cxButtonEditPredm.Properties.Buttons[0].Visible           :=false;
       T.cxTextEditName.Properties.ReadOnly          :=true;
       T.cxTextEditShortName.Properties.ReadOnly     :=true;
       T.cxTextEditKod.Properties.ReadOnly           :=true;
       T.cxTextEditNpp.Properties.ReadOnly           :=true;
       T.cxCheckBoxIsOCENKA.Properties.ReadOnly      :=true;
       T.cxCheckBoxIsNoRozpiska.Properties.ReadOnly  :=true;

       T.cxButtonEditISPIT_VEDOM_TYPE.Style.Color      :=TextViewColor;
       T.cxButtonEditPredm.Style.Color                 :=TextViewColor;
       T.cxTextEditName.Style.Color          :=TextViewColor;
       T.cxTextEditShortName.Style.Color     :=TextViewColor;
       T.cxTextEditKod.Style.Color           :=TextViewColor;
       T.cxTextEditNpp.Style.Color           :=TextViewColor;
       T.cxCheckBoxIsOCENKA.Style.Color      :=TextViewColor;
       T.cxCheckBoxIsNoRozpiska.Style.Color  :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;
end;

procedure TFormPRK_SP_TYPE_DOP_DOK.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
    begin
      if DataSetPrKSprav.FieldValues[ID_NAME]=-1 then exit;
      FillArrayFromDataSet(ParamSprav['Output'],DataSetPrKSprav);
    end;
  inherited;
end;

end.
