unit uPRK_SP_PREIM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravTwoLevel, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, dxBar, dxBarExtItems, DB, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  ImgList, ActnList, cxInplaceContainer, cxDBTL, cxTLData, cxControls,
  dxStatusBar, cxCheckBox,uPrK_Resources;

type
  TFormPRK_SP_PREIM = class(TFormPrK_SpravTwoLevel)
    cxDBTreeListPrKSpravTwoLevelPREIM: TcxDBTreeList;
    colNAME: TcxDBTreeListColumn;
    colSHORT_NAME: TcxDBTreeListColumn;
    colIS_FIZL_LGOTA: TcxDBTreeListColumn;
    colNPP: TcxDBTreeListColumn;
    colKOD: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure cxDBTreeListPrKSpravTwoLevelPREIMDblClick(Sender: TObject);
    procedure DataSetPrKSpravAfterScroll(DataSet: TDataSet);
    procedure ActionOldExecute(Sender: TObject);
  private
     procedure InicCaption; override;
  public
    { Public declarations }
  end;

type
  TDataPrKSpravPreimKat=class(TDataPrKSprav)
  private
    FIS_FIZL_LGOTA: Smallint;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp: Integer;
                       aIS_FIZL_LGOTA :Smallint);overload;
    procedure SetIS_FIZL_LGOTA(const Value: Smallint);
  public
    property IS_FIZL_LGOTA :Smallint read FIS_FIZL_LGOTA write SetIS_FIZL_LGOTA;
  end;

var
  FormPRK_SP_PREIM: TFormPRK_SP_PREIM;

implementation
uses uConstants,uPrKSpravEditPREIM_KAT, uPrKKlassSprav,
     uPrKSpravEditPREIM_KAT_ForAdd, cxTextEdit, uPrKKlassSpravEdit;
{$R *.dfm}

procedure TFormPRK_SP_PREIM.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='KEY_FIELD';
  ID_NAME_FIRST_LEVEL  :='ID_SP_PREIM_KATEGORY';
  ID_NAME_SECOND_LEVEL :='ID_SP_PREIM';
  ShowNpp              := false;
  StoredProcAddNameFirstLevel     :='PRK_SP_PREIM_KATEGORY_ADD';
  StoredProcChangeNameFirstLevel  :='PRK_SP_PREIM_KATEGORY_CHANGE';
  StoredProcDelNameFirstLevel     :='PRK_SP_PREIM_KATEGORY_DEL';
  StoredProcAddNameSecondLevel    :='PRK_SP_PREIM_ADD';
  StoredProcChangeNameSecondLevel :='PRK_SP_PREIM_CHANGE';
  StoredProcDelNameSecondLevel    :='PRK_SP_PREIM_DEL';
  StoredProcOldNameSecondLevel    :='PRK_SP_PREIM_SET_OLD';

  CaptionFirstLevel    :=nCaptionFirstLevelPreim[IndexLanguage];
  CaptionSecondLevel   :=nCaptionSecondLevelPreim[IndexLanguage];

  SelectSQLText        :='Select * from PRK_SP_PREIM_TREE_SELECT';

  NamePrKSpravEdit     := PrKSpravEditFobProt;// возможно это не надо будет

  InicFormCaption      := nFormPRK_SP_PREIM_Caption[IndexLanguage];
  ActionOld.Enabled    := True;
  ActionOld.Visible    := True;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
  dxBarLargeButtonOld.Caption   :=nAction_Old[IndexLanguage];
  dxBarLargeButtonOld.Hint      :=nHintAction_Old[IndexLanguage];
  ActionOld.Caption   :=nAction_Old[IndexLanguage];
  ActionOld.Hint      :=nHintAction_Old[IndexLanguage];
end;

procedure TFormPRK_SP_PREIM.InicCaption;
begin
    inherited;
    if ShowNpp=true then colNPP.Visible:=true;
      colNAME.Caption.Text          :=nColName[IndexLanguage];
      colSHORT_NAME.Caption.Text    :=nColShortName[IndexLanguage];
      colIS_FIZL_LGOTA.Caption.Text :=ncolIS_FIZL_LGOTA[IndexLanguage];
      colKOD.Caption.Text           :=nColKod[IndexLanguage];
      colNPP.Caption.Text           :=nColNpp[IndexLanguage];
      dxBarLargeButtonOld.Caption   :=nAction_Old[IndexLanguage];
      dxBarLargeButtonOld.Hint      :=nHintAction_Old[IndexLanguage];
      ActionOld.Caption   :=nAction_Old[IndexLanguage];
      ActionOld.Hint      :=nHintAction_Old[IndexLanguage];

end;

procedure TFormPRK_SP_PREIM.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravPreimKat;
   T:TFormPrKSpravEditPREIM_KAT_ForAdd;
   TryAgain      :boolean;
   Parent_Id     :Int64;
begin
  if StoredProcAddName=StoredProcAddNameFirstLevel then
   begin
       TryAgain      :=false;
       DataPrKSpravAdd:=TDataPrKSpravPreimKat.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                                     StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
       if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
          then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

       T := TFormPrKSpravEditPREIM_KAT_ForAdd.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage]+CaptionEditForm;
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible          :=true;
          T.cxTextEditNPP.Visible       :=true;
          T.cxLabelNPPSecLev.Visible    :=true;
          T.cxTextEditNppSecLev.Visible :=true;
        end;
       T.cxTextEditKodSecLev.Text := DataSetPrKSprav.FieldValues['KOD_MAX_TWO_LEVEL']+1;
       T.cxTextEditNppSecLev.Text := DataSetPrKSprav.FieldValues['NPP_MAX_TWO_LEVEL']+1;
       if T.ShowModal=MrOk then
        begin
           StoredProcPrKSprav.Transaction.StartTransaction;
           StoredProcPrKSprav.StoredProcName:=StoredProcAddNameFirstLevel;
           StoredProcPrKSprav.Prepare;
           StoredProcPrKSprav.ParamByName('NAME').AsString       :=DataPrKSpravAdd.Name;
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString :=DataPrKSpravAdd.ShortName;
           StoredProcPrKSprav.ParamByName('KOD').AsInteger       :=DataPrKSpravAdd.Kod;
           StoredProcPrKSprav.ParamByName('NPP').AsInteger       :=DataPrKSpravAdd.Npp;
           StoredProcPrKSprav.ParamByName('IS_FIZL_LGOTA').AsInteger :=DataPrKSpravAdd.FIS_FIZL_LGOTA;
           try
              StoredProcPrKSprav.ExecProc;
              Parent_Id:=StoredProcPrKSprav.FieldByName('ID_OUT').AsInt64;
              DataPrKSpravAdd.Id:=Parent_Id;
              StoredProcPrKSprav.StoredProcName:=StoredProcAddNameSecondLevel;
              StoredProcPrKSprav.ParamByName('NAME').AsString            :=T.cxTextEditNameSecLev.Text;
              StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString      :=T.cxTextEditShortNameSecLev.Text;
              StoredProcPrKSprav.ParamByName('KOD').AsInteger            :=StrToInt(T.cxTextEditKodSecLev.Text);
              StoredProcPrKSprav.ParamByName('NPP').AsInteger            :=StrToInt(T.cxTextEditNppSecLev.Text);
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
       DataPrKSpravAdd.Free;
       DataPrKSpravAdd:=nil;
       if TryAgain=true
          then ActionADDExecute(Sender);
   end
   else inherited;
end;

procedure TFormPRK_SP_PREIM.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravPreimKat;
   T:TFormPrKSpravEditPREIM_KAT;
   TryAgain :boolean;
begin
   if StoredProcAddName=StoredProcAddNameFirstLevel then
   begin
     TryAgain:=false;
     if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
      begin
         DataPrKSpravChange:=TDataPrKSpravPreimKat.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                                DataSetPrKSprav.FieldValues['NAME'],
                                                DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                                StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                                StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                                DataSetPrKSprav.FieldValues['IS_FIZL_LGOTA']);

         T:=TFormPrKSpravEditPREIM_KAT.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

         T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndexLanguage]+CaptionEditForm;
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
             StoredProcPrKSprav.ParamByName('IS_FIZL_LGOTA').AsShort :=DataPrKSpravChange.IS_FIZL_LGOTA;
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
   end
   else inherited;
end;

procedure TFormPRK_SP_PREIM.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravPreimKat;
   T:TFormPrKSpravEditPREIM_KAT;
begin
   if StoredProcAddName=StoredProcAddNameFirstLevel then
    begin
       if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
        begin
           DataPrKSpravView:=TDataPrKSpravPreimKat.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                                    DataSetPrKSprav.FieldValues['NAME'],
                                                    DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                                    StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                                    StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                                    DataSetPrKSprav.FieldValues['IS_FIZL_LGOTA']);

           T:=TFormPrKSpravEditPREIM_KAT.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
           if ShowNpp=true then
            begin
              T.cxLabelNPP.Visible    :=true;
              T.cxTextEditNPP.Visible :=true;
            end;
           T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage]+CaptionEditForm;
           T.cxTextEditName.Properties.ReadOnly      :=true;
           T.cxTextEditShortName.Properties.ReadOnly :=true;
           T.cxTextEditKod.Properties.ReadOnly       :=true;
           T.cxTextEditNpp.Properties.ReadOnly       :=true;
           T.cxCheckBoxIS_FIZL_LGOTA.Properties.ReadOnly  :=true;
           T.cxTextEditName.Style.Color      :=TextViewColor;
           T.cxTextEditShortName.Style.Color :=TextViewColor;
           T.cxTextEditKod.Style.Color       :=TextViewColor;
           T.cxTextEditNpp.Style.Color       :=TextViewColor;
           T.cxCheckBoxIS_FIZL_LGOTA.Style.Color   :=TextViewColor;
           T.ShowModal;
           T.Free;
           T:=nil;
           DataPrKSpravView.Free;
           DataPrKSpravView:=nil;
        end;
    end
    else inherited;
end;

procedure TFormPRK_SP_PREIM.ActionDELExecute(Sender: TObject);
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDel[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
         begin

            if StrToInt(DataSetPrKSprav.FieldValues['GRID_LEVEL'])=2
               then  begin
                  DataSetLevel.Active  :=false;
                  DataSetLevel.SelectSQL.Clear;
                  DataSetLevel.SQLs.SelectSQL.Text :='Select * from PRK_SP_PREIM_SELECT where ID_SP_PREIM_KATEGORY=:ID_NAME_FIRST_LEVEL';
                  DataSetLevel.ParamByName('ID_NAME_FIRST_LEVEL').AsInt64 :=DataSetPrKSprav.FieldValues['PARENT_FIELD'];
                  DataSetLevel.CloseOpen(false);
                  DataSetLevel.FetchAll;  // Возвращает все записи с сервера на клиент, если без него то DataSetLevel.RecordCount вернет 1
                  if DataSetLevel.RecordCount=1
                   then begin
                    ShowMessage(nMsgCannotDelSecLevel[IndexLanguage]);
                    Exit;
                   end;
               end;

            StoredProcPrKSprav.Transaction.StartTransaction;
            StoredProcPrKSprav.StoredProcName:=StoredProcDelName;
            StoredProcPrKSprav.Prepare;
            StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64:= DataSetPrKSprav.FieldValues[ID_NAME];
            try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
              cxDBTreeListPrKSpravTwoLevelPREIM.GotoPrev;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
               end;
            end;
         end;
         inherited Obnovit(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]));
     end;

end;


procedure TFormPRK_SP_PREIM.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,6], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    ResultArray[5] :=DataSetPrKSprav.FieldValues['IS_FIZL_LGOTA'];
    ResultArray[6] :=DataSetPrKSprav.FieldValues['PARENT_FIELD'];
    close;
  end;
end;

{ TDataPrKSpravOcenka }

constructor TDataPrKSpravPreimKat.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aIS_FIZL_LGOTA: Smallint);
begin
   Create(aId, aName, aShortName,aKod,aNpp);
   IS_FIZL_LGOTA :=aIS_FIZL_LGOTA;
   
end;

constructor TDataPrKSpravPreimKat.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  IS_FIZL_LGOTA:=0;
end;

procedure TDataPrKSpravPreimKat.SetIS_FIZL_LGOTA(const Value: Smallint);
begin
  FIS_FIZL_LGOTA := Value;
end;

procedure TFormPRK_SP_PREIM.cxDBTreeListPrKSpravTwoLevelPREIMDblClick(
  Sender: TObject);
begin
  if FormStyle = fsNormal
   then dxBarLargeButtonVibrat.Click
   else dxBarLargeButtonChange.Click;
end;

procedure TFormPRK_SP_PREIM.DataSetPrKSpravAfterScroll(DataSet: TDataSet);
begin
    inherited;
    if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL
     then begin
       if StrToInt(DataSetPrKSprav.FieldValues['GRID_LEVEL'])=1
          then begin
             ActionOld.Enabled := False;
          end
          else begin
             ActionOld.Enabled := true;
          end;
     end
     else begin
             ActionOld.Enabled := false;
     end;
end;

procedure TFormPRK_SP_PREIM.ActionOldExecute(Sender: TObject);
begin
    if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
        if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDel[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
        begin

            if StrToInt(DataSetPrKSprav.FieldValues['GRID_LEVEL'])=2
                then  begin
                    DataSetLevel.Active  :=false;
                    DataSetLevel.SelectSQL.Clear;
                    DataSetLevel.SQLs.SelectSQL.Text :='Select * from PRK_SP_PREIM_SELECT where ID_SP_PREIM_KATEGORY=:ID_NAME_FIRST_LEVEL';
                    DataSetLevel.ParamByName('ID_NAME_FIRST_LEVEL').AsInt64 :=DataSetPrKSprav.FieldValues['PARENT_FIELD'];
                    DataSetLevel.CloseOpen(false);
                    DataSetLevel.FetchAll;  // Возвращает все записи с сервера на клиент, если без него то DataSetLevel.RecordCount вернет 1
                    if DataSetLevel.RecordCount=1
                    then begin
                        ShowMessage(nMsgCannotDelSecLevel[IndexLanguage]);
                        Exit;
                    end;
                    StoredProcPrKSprav.Transaction.StartTransaction;
                    StoredProcPrKSprav.StoredProcName:=StoredProcOldNameSecondLevel;
                    StoredProcPrKSprav.Prepare;
                    StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64:= DataSetPrKSprav.FieldValues[ID_NAME];
                    try
                        StoredProcPrKSprav.ExecProc;
                        StoredProcPrKSprav.Transaction.Commit;
                        cxDBTreeListPrKSpravTwoLevelPREIM.GotoPrev;
                    except on e :Exception do
                        begin
                            MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                                nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                                e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                            StoredProcPrKSprav.Transaction.Rollback;
                        end;
                    end;
                end;
            end;
        inherited Obnovit(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]));
    end;
end;

end.
