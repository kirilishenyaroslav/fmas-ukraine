unit uPUB_SP_USPEC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpec_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar,uPrK_Resources,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxTextEdit,
  ExtCtrls;

type
  TFormPUB_SP_USPEC = class(TFormSpec_SpravOneLevel)
    colMIN_PERELIK_SPEC_NAME: TcxGridDBColumn;
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
  TDataPrKSpravUSPEC=class(TDataPrKSprav)
  private
    FID_SP_MIN_PERELIK_SPEC: int64;
    FMIN_PERELIK_SPEC_NAME: string;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp : Integer;
                       aID_SP_MIN_PERELIK_SPEC  : int64;
                       aMIN_PERELIK_SPEC_NAME   : string);overload;
    procedure SetMIN_PERELIK_SPEC_NAME(const Value: string);
    procedure SetID_SP_MIN_PERELIK_SPEC(const Value: int64);
  public
    property ID_SP_MIN_PERELIK_SPEC :int64 read FID_SP_MIN_PERELIK_SPEC write SetID_SP_MIN_PERELIK_SPEC;
    property MIN_PERELIK_SPEC_NAME :string read FMIN_PERELIK_SPEC_NAME write SetMIN_PERELIK_SPEC_NAME;
  end;

var
  FormPUB_SP_USPEC: TFormPUB_SP_USPEC;

implementation
uses uConstants,uPUB_SP_USPEC_Edit;
{$R *.dfm}

procedure TFormPUB_SP_USPEC.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_USPEC';
  SelectSQLText        :='Select * from PUB_SP_USPEC_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PUB_SP_USPEC_ADD';
  StoredProcChangeName :='PUB_SP_USPEC_CHANGE';
  StoredProcDelName    :='PUB_SP_USPEC_DEL';
//  NamePrKSpravEdit     := SpecpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPUB_SP_USPEC_Caption[IndexLanguage];
  colMIN_PERELIK_SPEC_NAME.Caption:=ncolMIN_PERELIK_SPEC_NAME[IndexLanguage];
  colMIN_PERELIK_SPEC_NAME.DataBinding.FieldName:='MIN_PERELIK_SPEC_NAME';
  // ??? ID_USER_GLOBAL       :=ParamSprav['Input']['ID_USER_GLOBAL'].AsInt64;
  // ??? ID_GOD_NABORA_GLOBAL :=ParamSprav['Input']['God_Nabora'].AsInt64;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
  SearchPanel.Visible:=True;
end;

{ TDataPrKSpravDISC }

constructor TDataPrKSpravUSPEC.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aID_SP_MIN_PERELIK_SPEC: int64;
  aMIN_PERELIK_SPEC_NAME: string);
begin
  Create(aId, aName, aShortName,aKod,aNpp);
  ID_SP_MIN_PERELIK_SPEC    :=aID_SP_MIN_PERELIK_SPEC;
  MIN_PERELIK_SPEC_NAME :=aMIN_PERELIK_SPEC_NAME;
end;

constructor TDataPrKSpravUSPEC.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  ID_SP_MIN_PERELIK_SPEC :=-1;
  MIN_PERELIK_SPEC_NAME  :='';
end;

procedure TDataPrKSpravUSPEC.SetMIN_PERELIK_SPEC_NAME(const Value: string);
begin
  FMIN_PERELIK_SPEC_NAME := Value;
end;

procedure TDataPrKSpravUSPEC.SetID_SP_MIN_PERELIK_SPEC(const Value: int64);
begin
  FID_SP_MIN_PERELIK_SPEC := Value;
end;

procedure TFormPUB_SP_USPEC.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravUSPEC;
   T:TFormPUB_SP_USPEC_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravUSPEC.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                            StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPUB_SP_USPEC_Edit.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       StoredProcPrKSprav.ParamByName('ID_SP_MIN_PERELIK_SPEC').AsInt64 :=DataPrKSpravAdd.ID_SP_MIN_PERELIK_SPEC;
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

procedure TFormPUB_SP_USPEC.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravUSPEC;
   T:TFormPUB_SP_USPEC_Edit;
   TryAgain :boolean;
   ID_SP_MIN_PERELIK_SPEC_loc:Int64;
   MIN_PERELIK_SPEC_NAME_loc :String;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_MIN_PERELIK_SPEC']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_MIN_PERELIK_SPEC']=-1)
        then begin
          ID_SP_MIN_PERELIK_SPEC_loc := -1;
          MIN_PERELIK_SPEC_NAME_loc  := '';
        end
        else begin
          ID_SP_MIN_PERELIK_SPEC_loc := DataSetPrKSprav.FieldValues['ID_SP_MIN_PERELIK_SPEC'];
          MIN_PERELIK_SPEC_NAME_loc  := DataSetPrKSprav.FieldValues['MIN_PERELIK_SPEC_NAME'];
        end;

       DataPrKSpravChange:=TDataPrKSpravUSPEC.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_MIN_PERELIK_SPEC_loc,
                                              MIN_PERELIK_SPEC_NAME_loc);

       T:=TFormPUB_SP_USPEC_Edit.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           StoredProcPrKSprav.ParamByName('ID_SP_MIN_PERELIK_SPEC').AsInt64 :=DataPrKSpravChange.ID_SP_MIN_PERELIK_SPEC;
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

procedure TFormPUB_SP_USPEC.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravUSPEC;
   T:TFormPUB_SP_USPEC_Edit;
   ID_SP_MIN_PERELIK_SPEC_loc:Int64;
   MIN_PERELIK_SPEC_NAME_loc :String;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_MIN_PERELIK_SPEC']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_MIN_PERELIK_SPEC']=-1)
        then begin
          ID_SP_MIN_PERELIK_SPEC_loc := -1;
          MIN_PERELIK_SPEC_NAME_loc             := '';
        end
        else begin
          ID_SP_MIN_PERELIK_SPEC_loc := DataSetPrKSprav.FieldValues['ID_SP_MIN_PERELIK_SPEC'];
          MIN_PERELIK_SPEC_NAME_loc             := DataSetPrKSprav.FieldValues['MIN_PERELIK_SPEC_NAME'];
        end;

       DataPrKSpravView:=TDataPrKSpravUSPEC.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_MIN_PERELIK_SPEC_loc,
                                              MIN_PERELIK_SPEC_NAME_loc);

       T:=TFormPUB_SP_USPEC_Edit.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage];
       T.cxButtonEditMinPerelikSpec.Properties.ReadOnly      :=true;
       T.cxButtonEditMinPerelikSpec.Properties.Buttons[0].Visible:=false;

       T.cxTextEditName.Properties.ReadOnly          :=true;
       T.cxTextEditShortName.Properties.ReadOnly     :=true;
       T.cxTextEditKod.Properties.ReadOnly           :=true;
       T.cxTextEditNpp.Properties.ReadOnly           :=true;

       T.cxButtonEditMinPerelikSpec.Style.Color      :=TextViewColor;
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
