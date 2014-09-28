unit uPrK_SpravTwoLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSprav, cxGraphics, dxBar, dxBarExtItems, DB, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ImgList, ActnList, cxStyles, cxControls, dxStatusBar,
  cxCustomData, cxTL, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit,
  cxCheckBox;

type
  TFormPrK_SpravTwoLevel = class(TFormPrKKlassSprav)
    DataSetLevel: TpFIBDataSet;
    ActionOld: TAction;
    procedure DataSetPrKSpravAfterScroll(DataSet: TDataSet);
    procedure ActionADDExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionOldExecute(Sender: TObject);
  private
    FStoredProcAddNameFirstLevel: string;
    FStoredProcChangeNameFirstLevel: string;
    FStoredProcDelNameFirstLevel: string;
    FStoredProcAddNameSecondLevel: string;
    FStoredProcChangeNameSecondLevel: string;
    FStoredProcDelNameSecondLevel: string;
    FStoredProcOldNameSecondLevel: string;
    FID_NAME_SECOND_LEVEL: string;
    FID_NAME_FIRST_LEVEL: string;
    procedure StoredAddPar;override;
    procedure SetStoredProcAddNameFirstLevel(const Value: string);
    procedure SetStoredProcChangeNameFirstLevel(const Value: string);
    procedure SetStoredProcDelNameFirstLevel(const Value: string);
    procedure SetStoredProcAddNameSecondLevel(const Value: string);
    procedure SetStoredProcChangeNameSecondLevel(const Value: string);
    procedure SetStoredProcDelNameSecondLevel(const Value: string);
    procedure SetStoredProcOldNameSecondLevel(const Value: string);
    procedure SetID_NAME_FIRST_LEVEL(const Value: string);
    procedure SetID_NAME_SECOND_LEVEL(const Value: string);
    { Private declarations }
  public
    CaptionFirstLevel  :string;
    CaptionSecondLevel :string;
    procedure InicCaption; virtual;
    property StoredProcAddNameFirstLevel     :string read FStoredProcAddNameFirstLevel write SetStoredProcAddNameFirstLevel;
    property StoredProcChangeNameFirstLevel  :string read FStoredProcChangeNameFirstLevel write SetStoredProcChangeNameFirstLevel;
    property StoredProcDelNameFirstLevel     :string read FStoredProcDelNameFirstLevel write SetStoredProcDelNameFirstLevel;
    property StoredProcAddNameSecondLevel    :string read FStoredProcAddNameSecondLevel write SetStoredProcAddNameSecondLevel;
    property StoredProcChangeNameSecondLevel :string read FStoredProcChangeNameSecondLevel write SetStoredProcChangeNameSecondLevel;
    property StoredProcDelNameSecondLevel    :string read FStoredProcDelNameSecondLevel write SetStoredProcDelNameSecondLevel;
    property StoredProcOldNameSecondLevel    :string read FStoredProcOldNameSecondLevel write SetStoredProcOldNameSecondLevel;
    property ID_NAME_FIRST_LEVEL             :string read FID_NAME_FIRST_LEVEL write SetID_NAME_FIRST_LEVEL;
    property ID_NAME_SECOND_LEVEL            :string read FID_NAME_SECOND_LEVEL write SetID_NAME_SECOND_LEVEL;
  end;

var
  FormPrK_SpravTwoLevel: TFormPrK_SpravTwoLevel;

implementation
uses
   uPrK_Resources,uConstants,uPrKKlassSpravEdit,uPrKSpravEditStandart,
   uPrKSpravEditSecLevelAdd;
{$R *.dfm}

{ TFormPrK_SpravTwoLevel }

procedure TFormPrK_SpravTwoLevel.DataSetPrKSpravAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
    if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL
     then begin
       if StrToInt(DataSetPrKSprav.FieldValues['GRID_LEVEL'])=1
          then begin
             ActionVibrat.Enabled:=false;
            // ActionOld.Enabled := False;
             ID_NAME:=ID_NAME_FIRST_LEVEL;
             StoredProcAddName   :=StoredProcAddNameFirstLevel;
             StoredProcChangeName:=StoredProcChangeNameFirstLevel;
             StoredProcDelName   :=StoredProcDelNameFirstLevel;
             CaptionEditForm     :=CaptionFirstLevel;
          end
          else begin
             if FormStyle=fsNormal then ActionVibrat.Enabled:=true;
            // ActionOld.Enabled := true;
             ID_NAME:=ID_NAME_SECOND_LEVEL;
             StoredProcAddName    :=StoredProcAddNameSecondLevel;
             StoredProcChangeName :=StoredProcChangeNameSecondLevel;
             StoredProcDelName    :=StoredProcDelNameSecondLevel;
            // StoredProcOldName    :=StoredProcOldNameSecondLevel;
             CaptionEditForm      :=CaptionSecondLevel;
          end;
     end
     else begin
             ActionVibrat.Enabled:=false;
            // ActionOld.Enabled := false;
             ID_NAME:=ID_NAME_FIRST_LEVEL;
             StoredProcAddName   :=StoredProcAddNameFirstLevel;
             StoredProcChangeName:=StoredProcChangeNameFirstLevel;
             StoredProcDelName   :=StoredProcDelNameFirstLevel;
             CaptionEditForm     :=CaptionFirstLevel;
     end;
end;

procedure TFormPrK_SpravTwoLevel.SetID_NAME_FIRST_LEVEL(
  const Value: string);
begin
  FID_NAME_FIRST_LEVEL := Value;
end;

procedure TFormPrK_SpravTwoLevel.SetID_NAME_SECOND_LEVEL(
  const Value: string);
begin
  FID_NAME_SECOND_LEVEL := Value;
end;

procedure TFormPrK_SpravTwoLevel.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSprav;
   T:TFormPrKSpravEditSecLevelAdd;
   TryAgain      :boolean;
   Parent_Id     :Int64;
begin
   TryAgain      :=false;

   if StoredProcAddName=StoredProcAddNameFirstLevel
   then begin
         DataPrKSpravAdd:=TDataPrKSprav.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                               StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
         if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
            then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

         T := TFormPrKSpravEditSecLevelAdd.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

         T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage]+CaptionEditForm;
         if ShowNpp=true then
          begin
            T.cxLabelNPP.Visible    :=true;
            T.cxTextEditNPP.Visible :=true;
            T.cxLabelNPPSecLev.Visible    :=true;
            T.cxTextEditNppSecLev.Visible :=true;
          end;

         T.cxLabelName.Caption            :=  T.cxLabelName.Caption+CaptionFirstLevel;
         T.cxLabelShortName.Caption       :=  T.cxLabelShortName.Caption+CaptionFirstLevel;
         T.cxLabelNameSecLev.Caption      :=  T.cxLabelNameSecLev.Caption+CaptionSecondLevel;
         T.cxLabelShortNameSecLev.Caption :=  T.cxLabelShortNameSecLev.Caption+CaptionSecondLevel;
         T.cxLabelKodSecLev.Caption       :=  T.cxLabelKodSecLev.Caption+CaptionSecondLevel;
         T.cxLabelNppSecLev.Caption       :=  T.cxLabelNppSecLev.Caption+CaptionSecondLevel;

         T.cxTextEditKodSecLev.Text := DataSetPrKSprav.FieldValues['KOD_MAX_TWO_LEVEL']+1;
         T.cxTextEditNppSecLev.Text := DataSetPrKSprav.FieldValues['NPP_MAX_TWO_LEVEL']+1;
         if T.ShowModal=MrOk then
          begin
             StoredProcPrKSprav.Transaction.StartTransaction;
             StoredProcPrKSprav.StoredProcName:=StoredProcAddName;
             StoredProcPrKSprav.Prepare;
             StoredProcPrKSprav.ParamByName('NAME').AsString       :=DataPrKSpravAdd.Name;
             StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString :=DataPrKSpravAdd.ShortName;
             StoredProcPrKSprav.ParamByName('KOD').AsInteger       :=DataPrKSpravAdd.Kod;
             StoredProcPrKSprav.ParamByName('NPP').AsInteger       :=DataPrKSpravAdd.Npp;
             StoredAddPar; //
             try
                StoredProcPrKSprav.ExecProc;
                Parent_Id:=StoredProcPrKSprav.FieldByName('ID_OUT').AsInt64;
                DataPrKSpravAdd.Id:=Parent_Id;
                StoredProcPrKSprav.StoredProcName:=StoredProcAddNameSecondLevel;
                StoredProcPrKSprav.ParamByName('NAME').AsString            :=T.cxTextEditNameSecLev.Text;
                StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString      :=T.cxTextEditShortNameSecLev.Text;
                StoredProcPrKSprav.ParamByName('KOD').AsInteger            :=StrToInt(T.cxTextEditKodSecLev.Text);
                StoredProcPrKSprav.ParamByName('NPP').AsInteger            :=StrToInt(T.cxTextEditNppSecLev.Text);
                StoredAddPar; //
                StoredProcPrKSprav.ParamByName(ID_NAME_FIRST_LEVEL).AsInt64:=Parent_Id;
                try
                  StoredProcPrKSprav.ExecProc;
                  StoredProcPrKSprav.Transaction.commit;
                  except on e: Exception do
                   begin
                     MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                                nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                                e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                     StoredProcPrKSprav.Transaction.Rollback;
                     TryAgain:=true;
                   end;
                end;
              except on e: Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                            nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
                 TryAgain:=true;
               end;
             end;
          end
          else begin
            if StoredProcPrKSprav.Transaction.Active=true
              then StoredProcPrKSprav.Transaction.Rollback;
         end;
         T.Free;
         T:=nil;
         Obnovit(DataPrKSpravAdd.Id);
         if TryAgain=true
            then ActionADDExecute(Sender);
   end
   else inherited;
end;


procedure TFormPrK_SpravTwoLevel.SetStoredProcAddNameFirstLevel(
  const Value: string);
begin
  FStoredProcAddNameFirstLevel := Value;
end;

procedure TFormPrK_SpravTwoLevel.SetStoredProcAddNameSecondLevel(
  const Value: string);
begin
  FStoredProcAddNameSecondLevel := Value;
end;

procedure TFormPrK_SpravTwoLevel.SetStoredProcChangeNameFirstLevel(
  const Value: string);
begin
  FStoredProcChangeNameFirstLevel := Value;
end;

procedure TFormPrK_SpravTwoLevel.SetStoredProcChangeNameSecondLevel(
  const Value: string);
begin
  FStoredProcChangeNameSecondLevel := Value;
end;

procedure TFormPrK_SpravTwoLevel.SetStoredProcDelNameFirstLevel(
  const Value: string);
begin
  FStoredProcDelNameFirstLevel := Value;
end;

procedure TFormPrK_SpravTwoLevel.SetStoredProcDelNameSecondLevel(
  const Value: string);
begin
  FStoredProcDelNameSecondLevel := Value;
end;

procedure TFormPrK_SpravTwoLevel.SetStoredProcOldNameSecondLevel(
  const Value: string);
begin
  FStoredProcOldNameSecondLevel := Value;
end;

procedure TFormPrK_SpravTwoLevel.FormCreate(Sender: TObject);
begin
  inherited;
  // надо, чтобы пустое было потому как не видит без этого создание формы...
  // Будет время - надо будет разобраться почему в одноуровневом видит а в двух нет
end;

procedure TFormPrK_SpravTwoLevel.StoredAddPar;
begin
  if StoredProcAddName=StoredProcAddNameSecondLevel
    then if DataSetPrKSprav.FieldValues[ID_NAME_FIRST_LEVEL]<>Null
           then StoredProcPrKSprav.ParamByName(ID_NAME_FIRST_LEVEL).AsInt64:=DataSetPrKSprav.FieldValues[ID_NAME_FIRST_LEVEL];
end;

procedure TFormPrK_SpravTwoLevel.ActionOldExecute(Sender: TObject);
begin
  inherited;
   //
end;

procedure TFormPrK_SpravTwoLevel.InicCaption;
begin
   inherited;
   ActionOld.Caption   := nAction_Old[IndexLanguage];
   ActionOld.Hint      := nHintAction_Old[IndexLanguage];
   dxBarLargeButtonOld.Caption   :=nAction_Old[IndexLanguage];
   dxBarLargeButtonOld.Hint      :=nHintAction_Old[IndexLanguage];
end;
end.
