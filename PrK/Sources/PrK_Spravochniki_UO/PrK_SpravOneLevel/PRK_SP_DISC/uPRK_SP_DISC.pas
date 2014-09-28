unit uPRK_SP_DISC;

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
  TFormPRK_SP_DISC = class(TFormPrK_SpravOneLevel)
    colTYPE_DISC_NAME: TcxGridDBColumn;
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
  TDataPrKSpravDISC=class(TDataPrKSprav)
  private
    FID_SP_TYPE_DISC: int64;
    FTYPE_DISC_NAME: string;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp : Integer;
                       aID_SP_TYPE_DISC  : int64;
                       aTYPE_DISC_NAME   : string);overload;
    procedure SetTYPE_DISC_NAME(const Value: string);
    procedure SetID_SP_TYPE_DISC(const Value: int64);
  public
    property ID_SP_TYPE_DISC :int64 read FID_SP_TYPE_DISC write SetID_SP_TYPE_DISC;
    property TYPE_DISC_NAME :string read FTYPE_DISC_NAME write SetTYPE_DISC_NAME;
  end;

var
  FormPRK_SP_DISC: TFormPRK_SP_DISC;

implementation
uses uConstants,uPRK_SP_DISC_Edit;
{$R *.dfm}

procedure TFormPRK_SP_DISC.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_DISC';
  SelectSQLText        :='Select * from UO_SP_DISC_S';
  ShowNpp              := false;
  StoredProcAddName    :='UO_SP_DISC_I';
  StoredProcChangeName :='UO_SP_DISC_U';
  StoredProcDelName    :='UO_SP_DISC_D';
  NamePrKSpravEdit     := PrKSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_DISC_Caption[IndexLanguage];
  colTYPE_DISC_NAME.Caption:=ncolTYPE_DISC_NAME[IndexLanguage];
  // ??? ID_USER_GLOBAL       :=ParamSprav['Input']['ID_USER_GLOBAL'].AsInt64;
  // ??? ID_GOD_NABORA_GLOBAL :=ParamSprav['Input']['God_Nabora'].AsInt64;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

{ TDataPrKSpravDISC }

constructor TDataPrKSpravDISC.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aID_SP_TYPE_DISC: int64;
  aTYPE_DISC_NAME: string);
begin
  Create(aId, aName, aShortName,aKod,aNpp);
  ID_SP_TYPE_DISC    :=aID_SP_TYPE_DISC;
  TYPE_DISC_NAME :=aTYPE_DISC_NAME;
end;

constructor TDataPrKSpravDISC.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  ID_SP_TYPE_DISC :=-1;
  TYPE_DISC_NAME             :='';
end;

procedure TDataPrKSpravDISC.SetTYPE_DISC_NAME(const Value: string);
begin
  FTYPE_DISC_NAME := Value;
end;

procedure TDataPrKSpravDISC.SetID_SP_TYPE_DISC(const Value: int64);
begin
  FID_SP_TYPE_DISC := Value;
end;

procedure TFormPRK_SP_DISC.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravDISC;
   T:TFormPrK_SP_DISC_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravDISC.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                            StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrK_SP_DISC_Edit.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       StoredProcPrKSprav.ParamByName('ID_SP_TYPE_DISC').AsInt64        :=DataPrKSpravAdd.ID_SP_TYPE_DISC;
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

procedure TFormPRK_SP_DISC.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravDISC;
   T:TFormPrK_SP_DISC_Edit;
   TryAgain :boolean;
   ID_SP_TYPE_DISC_loc:Int64;
   TYPE_DISC_NAME_loc :String;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_TYPE_DISC']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_TYPE_DISC']=-1)
        then begin
          ID_SP_TYPE_DISC_loc := -1;
          TYPE_DISC_NAME_loc             := '';
        end
        else begin
          ID_SP_TYPE_DISC_loc := DataSetPrKSprav.FieldValues['ID_SP_TYPE_DISC'];
          TYPE_DISC_NAME_loc             := DataSetPrKSprav.FieldValues['TYPE_DISC_NAME'];
        end;

       DataPrKSpravChange:=TDataPrKSpravDISC.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_TYPE_DISC_loc,
                                              TYPE_DISC_NAME_loc);

       T:=TFormPrK_SP_DISC_Edit.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           StoredProcPrKSprav.ParamByName('ID_SP_TYPE_DISC').AsInt64        :=DataPrKSpravChange.ID_SP_TYPE_DISC;
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

procedure TFormPRK_SP_DISC.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravDISC;
   T:TFormPrK_SP_DISC_Edit;
   ID_SP_TYPE_DISC_loc:Int64;
   TYPE_DISC_NAME_loc :String;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_TYPE_DISC']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_TYPE_DISC']=-1)
        then begin
          ID_SP_TYPE_DISC_loc := -1;
          TYPE_DISC_NAME_loc             := '';
        end
        else begin
          ID_SP_TYPE_DISC_loc := DataSetPrKSprav.FieldValues['ID_SP_TYPE_DISC'];
          TYPE_DISC_NAME_loc             := DataSetPrKSprav.FieldValues['TYPE_DISC_NAME'];
        end;

       DataPrKSpravView:=TDataPrKSpravDISC.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_TYPE_DISC_loc,
                                              TYPE_DISC_NAME_loc);

       T:=TFormPrK_SP_DISC_Edit.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage];
       T.cxButtonEditTypeDisc.Properties.ReadOnly      :=true;
       T.cxButtonEditTypeDisc.Properties.Buttons[0].Visible:=false;

       T.cxTextEditName.Properties.ReadOnly          :=true;
       T.cxTextEditShortName.Properties.ReadOnly     :=true;
       T.cxTextEditKod.Properties.ReadOnly           :=true;
       T.cxTextEditNpp.Properties.ReadOnly           :=true;

       T.cxButtonEditTypeDisc.Style.Color      :=TextViewColor;
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
