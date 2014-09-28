unit uPUB_SP_SPEC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpec_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar,uPrK_Resources,
  cxCheckBox, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTextEdit, ExtCtrls;

type
  TFormPUB_SP_SPEC = class(TFormSpec_SpravOneLevel)
    colUSPEC_NAME: TcxGridDBColumn;
    colMOVA_NAME: TcxGridDBColumn;
    colFULL_NAME: TcxGridDBColumn;
    ColIS_OLD: TcxGridDBColumn;
    ActionMakeOld: TAction;
    dxBarLargeButtonMakeOld: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionMakeOldExecute(Sender: TObject);
  private
    { Private declarations }
    FStoredProcMakeOldName: String;
    procedure SetStoredProcMakeOldName(const Value: string);
  public
    ID_USER_GLOBAL,ID_GOD_NABORA_GLOBAL : int64;
    property StoredProcMakeOldName:string read FStoredProcMakeOldName write SetStoredProcMakeOldName;
  end;

  type
  TDataPrKSpravSPEC=class(TDataPrKSprav)
  private
    FFullName: string;
    FID_SP_USPEC: int64;
    FUSPEC_NAME: string;
    FID_SP_MOVA: int64;
    FMOVA_NAME: string;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String; aFullName:String;
                       aKod:Integer;aNpp : Integer;
                       aID_SP_USPEC  : int64;
                       aUSPEC_NAME   : string;
                       aID_SP_MOVA  : int64;
                       aMOVA_NAME   : string);overload;
    procedure SetUSPEC_NAME(const Value: string);
    procedure SetID_SP_USPEC(const Value: int64);
    procedure SetMOVA_NAME(const Value: string);
    procedure SetID_SP_MOVA(const Value: int64);
    procedure SetFullName(const Value: string);
  public
    property ID_SP_USPEC :int64 read FID_SP_USPEC write SetID_SP_USPEC;
    property USPEC_NAME :string read FUSPEC_NAME write SetUSPEC_NAME;
    property ID_SP_MOVA :int64 read FID_SP_MOVA write SetID_SP_MOVA;
    property MOVA_NAME :string read FMOVA_NAME write SetMOVA_NAME;
    property FullName :string read FFullName write SetFullName;
  end;

var
  FormPUB_SP_SPEC: TFormPUB_SP_SPEC;

implementation
uses uConstants,uPUB_SP_SPEC_Edit, uSpecKlassSprav;
{$R *.dfm}

procedure TFormPUB_SP_SPEC.FormCreate(Sender: TObject);
var p:Boolean;
begin
  inherited;

  if Assigned(ParamSprav) then
    p:=ParamSprav['Input']['ShowOld'].AsVariant
  else
    p:=False;

  ColIS_OLD.Visible:=p;
  ActionMakeOld.Visible:=p;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_SPEC';
  if p then
    SelectSQLText        :='Select * from PUB_SP_SPEC_SELECT(0)'
  else
    SelectSQLText        :='Select * from PUB_SP_SPEC_SELECT(1)';
  ShowNpp              := false;
  StoredProcAddName    :='PUB_SP_SPEC_ADD';
  StoredProcChangeName :='PUB_SP_SPEC_CHANGE';
  StoredProcDelName    :='PUB_SP_SPEC_DEL';
  StoredProcMakeOldName:='PUB_SP_SPEC_MAKE_OLD';
//  NamePrKSpravEdit     := SpecSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :=nFormPUB_SP_SPEC_Caption[IndexLanguage];
//  colUSPEC_NAME.Caption:=ncolUSPEC_NAME[IndexLanguage];
  colUSPEC_NAME.DataBinding.FieldName:='USPEC_NAME';
  colMOVA_NAME.DataBinding.FieldName:='MOVA_NAME';
  colFULL_NAME.DataBinding.FieldName:='FULL_NAME';
  ColIS_OLD.DataBinding.FieldName   :='IS_OLD';
  colUSPEC_NAME.Caption:=ncolUSPEC_NAME[IndexLanguage];
  colMOVA_NAME.Caption:=ncolMOVA[IndexLanguage];
  ColIS_OLD.Caption:=ncolIS_OLD[IndexLanguage];
  colFULL_NAME.Caption:=ncolFullName[IndexLanguage];

  ActionMakeOld.Caption:=nActionMakeOld[IndexLanguage];
  ActionMakeOld.Hint:=nHintActionMakeOld[IndexLanguage];

  // ??? ID_USER_GLOBAL       :=ParamSprav['Input']['ID_USER_GLOBAL'].AsInt64;
  // ??? ID_GOD_NABORA_GLOBAL :=ParamSprav['Input']['God_Nabora'].AsInt64;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
  SearchPanel.Visible:=True;
end;

procedure TFormPUB_SP_SPEC.SetStoredProcMakeOldName(const Value: string);
begin
  FStoredProcMakeOldName := Value;
end;

{ TDataPrKSpravDISC }

constructor TDataPrKSpravSPEC.Create(aId: int64; aName,
  aShortName: String; aFullName:String; aKod, aNpp: Integer; aID_SP_USPEC: int64;
  aUSPEC_NAME: string; aID_SP_MOVA: int64; aMOVA_NAME: string);
begin
  Create(aId, aName, aShortName,aKod,aNpp);
  ID_SP_USPEC    :=aID_SP_USPEC;
  USPEC_NAME :=aUSPEC_NAME;
  ID_SP_MOVA    :=aID_SP_MOVA;
  MOVA_NAME :=aMOVA_NAME;
  FullName := aFullName;
end;

constructor TDataPrKSpravSPEC.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  ID_SP_USPEC :=-1;
  USPEC_NAME  :='';
  ID_SP_MOVA :=-1;
  MOVA_NAME  :='';
  FullName := '';
end;

procedure TDataPrKSpravSPEC.SetUSPEC_NAME(const Value: string);
begin
  FUSPEC_NAME := Value;
end;

procedure TDataPrKSpravSPEC.SetID_SP_USPEC(const Value: int64);
begin
  FID_SP_USPEC := Value;
end;

procedure TDataPrKSpravSPEC.SetMOVA_NAME(const Value: string);
begin
  FMOVA_NAME := Value;
end;

procedure TDataPrKSpravSPEC.SetID_SP_MOVA(const Value: int64);
begin
  FID_SP_MOVA := Value;
end;

procedure TDataPrKSpravSPEC.SetFullName(const Value: string);
begin
  FFullName := Value;
end;

procedure TFormPUB_SP_SPEC.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravSPEC;
   T:TFormPUB_SP_SPEC_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravSPEC.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                            StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPUB_SP_SPEC_Edit.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       StoredProcPrKSprav.ParamByName('IS_OLD').AsInteger               :=0;
       StoredProcPrKSprav.ParamByName('NAME').AsString                  :=DataPrKSpravAdd.Name;
       StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString            :=DataPrKSpravAdd.ShortName;
       StoredProcPrKSprav.ParamByName('FULL_NAME').AsString             :=DataPrKSpravAdd.FullName;
       StoredProcPrKSprav.ParamByName('KOD').AsInteger                  :=DataPrKSpravAdd.Kod;
       StoredProcPrKSprav.ParamByName('NPP').AsInteger                  :=DataPrKSpravAdd.Npp;
       StoredProcPrKSprav.ParamByName('ID_SP_USPEC').AsInt64 :=DataPrKSpravAdd.ID_SP_USPEC;
       StoredProcPrKSprav.ParamByName('ID_SP_MOVA').AsInt64 :=DataPrKSpravAdd.ID_SP_MOVA;
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

procedure TFormPUB_SP_SPEC.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravSPEC;
   T:TFormPUB_SP_SPEC_Edit;
   TryAgain :boolean;
   ID_SP_USPEC_loc:Int64;
   USPEC_NAME_loc :String;
   ID_SP_MOVA_loc:Int64;
   MOVA_NAME_loc :String;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_USPEC']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_USPEC']=-1)
        then begin
          ID_SP_USPEC_loc := -1;
          USPEC_NAME_loc  := '';
        end
        else begin
          ID_SP_USPEC_loc := DataSetPrKSprav.FieldValues['ID_SP_USPEC'];
          USPEC_NAME_loc  := DataSetPrKSprav.FieldValues['USPEC_NAME'];
        end;

       if (DataSetPrKSprav.FieldValues['ID_SP_MOVA']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_MOVA']=-1)
        then begin
          ID_SP_MOVA_loc := -1;
          MOVA_NAME_loc  := '';
        end
        else begin
          ID_SP_MOVA_loc := DataSetPrKSprav.FieldValues['ID_SP_MOVA'];
          MOVA_NAME_loc  := DataSetPrKSprav.FieldValues['MOVA_NAME'];
        end;

       DataPrKSpravChange:=TDataPrKSpravSPEC.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              DataSetPrKSprav.FieldValues['FULL_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_USPEC_loc,
                                              USPEC_NAME_loc,
                                              ID_SP_MOVA_loc,
                                              MOVA_NAME_loc);

       T:=TFormPUB_SP_SPEC_Edit.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           StoredProcPrKSprav.ParamByName('IS_OLD').AsInteger               :=DataSetPrKSprav['IS_OLD'];
           StoredProcPrKSprav.ParamByName('NAME').AsString                  :=DataPrKSpravChange.Name;
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString            :=DataPrKSpravChange.ShortName;
           StoredProcPrKSprav.ParamByName('FULL_NAME').AsString             :=DataPrKSpravChange.FullName;
           StoredProcPrKSprav.ParamByName('KOD').AsInteger                  :=DataPrKSpravChange.Kod;
           StoredProcPrKSprav.ParamByName('NPP').AsInteger                  :=DataPrKSpravChange.Npp;
           StoredProcPrKSprav.ParamByName('ID_SP_USPEC').AsInt64 :=DataPrKSpravChange.ID_SP_USPEC;
           StoredProcPrKSprav.ParamByName('ID_SP_MOVA').AsInt64 :=DataPrKSpravChange.ID_SP_MOVA;
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

procedure TFormPUB_SP_SPEC.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravSPEC;
   T:TFormPUB_SP_SPEC_Edit;
   ID_SP_USPEC_loc:Int64;
   USPEC_NAME_loc :String;
   ID_SP_MOVA_loc:Int64;
   MOVA_NAME_loc :String;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       if (DataSetPrKSprav.FieldValues['ID_SP_USPEC']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_USPEC']=-1)
        then begin
          ID_SP_USPEC_loc := -1;
          USPEC_NAME_loc             := '';
        end
        else begin
          ID_SP_USPEC_loc := DataSetPrKSprav.FieldValues['ID_SP_USPEC'];
          USPEC_NAME_loc             := DataSetPrKSprav.FieldValues['USPEC_NAME'];
        end;

       if (DataSetPrKSprav.FieldValues['ID_SP_MOVA']=Null) or
          (DataSetPrKSprav.FieldValues['ID_SP_MOVA']=-1)
        then begin
          ID_SP_MOVA_loc := -1;
          MOVA_NAME_loc             := '';
        end
        else begin
          ID_SP_MOVA_loc := DataSetPrKSprav.FieldValues['ID_SP_MOVA'];
          MOVA_NAME_loc             := DataSetPrKSprav.FieldValues['MOVA_NAME'];
        end;

       DataPrKSpravView:=TDataPrKSpravSPEC.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              DataSetPrKSprav.FieldValues['FULL_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              ID_SP_USPEC_loc,
                                              USPEC_NAME_loc,
                                              ID_SP_MOVA_loc,
                                              MOVA_NAME_loc);

       T:=TFormPUB_SP_SPEC_Edit.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage];
       T.cxButtonEditUSpec.Properties.ReadOnly          :=true;
       T.cxButtonEditUSpec.Properties.Buttons[0].Visible:=false;
       T.cxButtonEditMova.Properties.ReadOnly           :=true;
       T.cxButtonEditMova.Properties.Buttons[0].Visible :=false;

       T.cxTextEditName.Properties.ReadOnly          :=true;
       T.cxTextEditFullName.Properties.ReadOnly      :=true;
       T.cxTextEditShortName.Properties.ReadOnly     :=true;
       T.cxTextEditKod.Properties.ReadOnly           :=true;
       T.cxTextEditNpp.Properties.ReadOnly           :=true;

       T.cxButtonEditUSpec.Style.Color       :=TextViewColor;
       T.cxButtonEditMova.Style.Color        :=TextViewColor;
       T.cxTextEditName.Style.Color          :=TextViewColor;
       T.cxTextEditFullName.Style.Color      :=TextViewColor;
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

procedure TFormPUB_SP_SPEC.ActionMakeOldExecute(Sender: TObject);
begin
  inherited;
       if DataSetPrKSprav['IS_OLD']=1 then exit;

       if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgMakeOld[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)<>mrOK then EXIT;

           StoredProcPrKSprav.Transaction.StartTransaction;
           StoredProcPrKSprav.StoredProcName:=StoredProcMakeOldName;
           StoredProcPrKSprav.Prepare;
           StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64 :=DataSetPrKSprav[ID_NAME];
           try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
              end;
           end;
       Obnovit(DataSetPrKSprav[ID_NAME]);
end;

end.
