unit uPRK_SP_FOB_PROT;

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
  TFormPRK_SP_FOB_PROT = class(TFormPrK_SpravOneLevel)
    colVINIT_PADEG: TcxGridDBColumn;
    colRODIT_PADEG: TcxGridDBColumn;
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
  TDataPrKSpravFobProt=class(TDataPrKSprav)
  private
    FRoditPadeg: string;
    FVinitPadeg: string;
    procedure SetRoditPadeg(const Value: string);
    procedure SetVinitPadeg(const Value: string);
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp: Integer;
                       aVinitPadeg :string;aRoditPadeg :string);overload;
  public
    property VinitPadeg :string read FVinitPadeg write SetVinitPadeg;
    property RoditPadeg :string read FRoditPadeg write SetRoditPadeg;
  end;

var
  FormPRK_SP_FOB_PROT: TFormPRK_SP_FOB_PROT;

implementation
uses uConstants, uPrKKlassSprav,uPrKSpravEditFobProt ;
{$R *.dfm}

procedure TFormPRK_SP_FOB_PROT.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_FOB_PROT';
  SelectSQLText        :='Select * from PRK_SP_FOB_PROT_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_FOB_PROT_ADD';
  StoredProcChangeName :='PRK_SP_FOB_PROT_CHANGE';
  StoredProcDelName    :='PRK_SP_FOB_PROT_DEL';
  NamePrKSpravEdit     := PrKSpravEditFobProt;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_FOB_PROT_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_FOB_PROT.InicCaption;
begin
  inherited  InicCaption;
  colVINIT_PADEG.Caption   := ncolVINIT_PADEG[IndexLanguage];
  colRODIT_PADEG.Caption   := ncolRODIT_PADEG[IndexLanguage];
end;

{ TDataPrKSpravFobProt }

constructor TDataPrKSpravFobProt.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  VinitPadeg:='';
  RoditPadeg:='';
end;

constructor TDataPrKSpravFobProt.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aVinitPadeg,
  aRoditPadeg: string);
begin
   Create(aId, aName, aShortName,aKod,aNpp);
   VinitPadeg:=aVinitPadeg;
   RoditPadeg:=aRoditPadeg;
end;

procedure TDataPrKSpravFobProt.SetRoditPadeg(const Value: string);
begin
  FRoditPadeg := Value;
end;

procedure TDataPrKSpravFobProt.SetVinitPadeg(const Value: string);
begin
  FVinitPadeg := Value;
end;





procedure TFormPRK_SP_FOB_PROT.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravFobProt;
   T:TFormPrKSpravEditFobProt;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravFobProt.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                                StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrKSpravEditFobProt.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       StoredProcPrKSprav.ParamByName('VINIT_PADEG').AsString  :=DataPrKSpravAdd.VinitPadeg;
       StoredProcPrKSprav.ParamByName('RODIT_PADEG').AsString  :=DataPrKSpravAdd.RoditPadeg;
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

procedure TFormPRK_SP_FOB_PROT.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravFobProt;
   T:TFormPrKSpravEditFobProt;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravChange:=TDataPrKSpravFobProt.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['VINIT_PADEG'],
                                              DataSetPrKSprav.FieldValues['RODIT_PADEG']);

       T:=TFormPrKSpravEditFobProt.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           StoredProcPrKSprav.ParamByName('VINIT_PADEG').AsString  :=DataPrKSpravChange.VinitPadeg;
           StoredProcPrKSprav.ParamByName('RODIT_PADEG').AsString  :=DataPrKSpravChange.RoditPadeg;
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

procedure TFormPRK_SP_FOB_PROT.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravFobProt;
   T:TFormPrKSpravEditFobProt;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravView:=TDataPrKSpravFobProt.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['VINIT_PADEG'],
                                              DataSetPrKSprav.FieldValues['RODIT_PADEG']);

       T:=TFormPrKSpravEditFobProt.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
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
       T.cxTextEditVinitPadeg.Properties.ReadOnly       :=true;
       T.cxTextEditRoditPadeg.Properties.ReadOnly       :=true;
       T.cxTextEditName.Style.Color      :=TextViewColor;
       T.cxTextEditShortName.Style.Color :=TextViewColor;
       T.cxTextEditKod.Style.Color       :=TextViewColor;
       T.cxTextEditNpp.Style.Color       :=TextViewColor;
       T.cxTextEditVinitPadeg.Style.Color       :=TextViewColor;
       T.cxTextEditRoditPadeg.Style.Color       :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;

end;

procedure TFormPRK_SP_FOB_PROT.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,6], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    ResultArray[5] :=DataSetPrKSprav.FieldValues['VINIT_PADEG'];
    ResultArray[6] :=DataSetPrKSprav.FieldValues['RODIT_PADEG'];
    close;
  end;
end;

end.
