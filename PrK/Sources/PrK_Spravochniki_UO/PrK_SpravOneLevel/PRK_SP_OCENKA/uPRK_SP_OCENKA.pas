unit uPRK_SP_OCENKA;

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
  TFormPRK_SP_OCENKA = class(TFormPrK_SpravOneLevel)
    colIS_SPIVBESIDA: TcxGridDBColumn;
    colIS_ZALIK: TcxGridDBColumn;
    colOCENKA_NUM: TcxGridDBColumn;
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
  TDataPrKSpravOcenka=class(TDataPrKSprav)
  private
    FIsSpivbesida: Smallint;
    FIsZaliK: Smallint;
    FOcenka_Num: Smallint;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
     constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp: Integer;
                       aIsSpivbesida :Smallint;aIsZaliK :Smallint;
                       aOcenka_Num :Smallint);overload;
    procedure SetIsSpivbesida(const Value: Smallint);
    procedure SetIsZaliK(const Value: Smallint);
    procedure SetOcenka_Num(const Value: Smallint);
  public
    property Ocenka_Num :Smallint read FOcenka_Num write SetOcenka_Num;
    property IsSpivbesida :Smallint read FIsSpivbesida write SetIsSpivbesida;
    property IsZaliK :Smallint read FIsZaliK write SetIsZaliK;

  end;

var
  FormPRK_SP_OCENKA: TFormPRK_SP_OCENKA;

implementation
uses uConstants, uPrKKlassSprav, uPrKSpravEditOCENKA;
{$R *.dfm}

procedure TFormPRK_SP_OCENKA.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_SP_OCENKA';
  if ParamSprav =Nil
   then SelectSQLText        :='Select * from PRK_SP_OCENKA_SELECT'
   else SelectSQLText        :='Select * from PRK_SP_OCENKA_SELECT where '
                              +'IS_SPIVBESIDA='+IntToStr(ParamSprav['Input']['IS_SPIVBESIDA'].AsInteger)+' and '
                              +'IS_ZALIK='+IntToStr(ParamSprav['Input']['IS_ZALIK'].AsInteger) +' and '
                              +'OCENKA_NUM<>0';
  ShowNpp              := false;
  StoredProcAddName    :='PRK_SP_OCENKA_ADD';
  StoredProcChangeName :='PRK_SP_OCENKA_CHANGE';
  StoredProcDelName    :='PRK_SP_OCENKA_DEL';
  //NamePrKSpravEdit     := PrKSpravEditFobProt;// возможно это не надо будет

  InicFormCaption      :=nFormPRK_SP_OCENKA_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_OCENKA.InicCaption;
begin
  inherited;
  colIS_SPIVBESIDA.Caption   :=ncolIS_SPIVBESIDA[IndexLanguage];
  colIS_ZALIK.Caption        :=ncolIS_ZALIK[IndexLanguage];
  colOCENKA_NUM.Caption      :=ncolOCENKA_NUM[IndexLanguage];
end;

{ TDataPrKSpravFobProt }


constructor TDataPrKSpravOcenka.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  IsSpivbesida :=0;
  IsZaliK      :=0;
  Ocenka_Num   :=0;
end;

constructor TDataPrKSpravOcenka.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aIsSpivbesida, aIsZaliK,
  aOcenka_Num: Smallint);
begin
   Create(aId, aName, aShortName,aKod,aNpp);
   IsSpivbesida :=aIsSpivbesida;
   IsZaliK      :=aIsZaliK;
   Ocenka_Num   :=aOcenka_Num;
end;

procedure TDataPrKSpravOcenka.SetIsSpivbesida(const Value: Smallint);
begin
  FIsSpivbesida := Value;
end;

procedure TDataPrKSpravOcenka.SetIsZaliK(const Value: Smallint);
begin
  FIsZaliK := Value;
end;

procedure TDataPrKSpravOcenka.SetOcenka_Num(const Value: Smallint);
begin
 case  Value of
  0..12: FOcenka_Num := Value;
  else   FOcenka_Num :=0;
 end;
end;

procedure TFormPRK_SP_OCENKA.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravOcenka;
   T:TFormPrKSpravEditOCENKA;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravOcenka.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                                StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrKSpravEditOCENKA.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

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
       StoredProcPrKSprav.ParamByName('IS_SPIVBESIDA').AsShort :=DataPrKSpravAdd.IsSpivbesida;
       StoredProcPrKSprav.ParamByName('IS_ZALIK').AsShort      :=DataPrKSpravAdd.IsZaliK;
       StoredProcPrKSprav.ParamByName('OCENKA_NUM').AsShort    :=DataPrKSpravAdd.Ocenka_Num;
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

procedure TFormPRK_SP_OCENKA.ActionChangeExecute(Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravOcenka;
   T:TFormPrKSpravEditOCENKA;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravChange:=TDataPrKSpravOcenka.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['IS_SPIVBESIDA'],
                                              DataSetPrKSprav.FieldValues['IS_ZALIK'],
                                              DataSetPrKSprav.FieldValues['OCENKA_NUM']);

       T:=TFormPrKSpravEditOCENKA.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

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
           StoredProcPrKSprav.ParamByName('IS_SPIVBESIDA').AsShort :=DataPrKSpravChange.IsSpivbesida;
           StoredProcPrKSprav.ParamByName('IS_ZALIK').AsShort      :=DataPrKSpravChange.IsZaliK;
           StoredProcPrKSprav.ParamByName('OCENKA_NUM').AsShort    :=DataPrKSpravChange.Ocenka_Num;
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

procedure TFormPRK_SP_OCENKA.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravOcenka;
   T:TFormPrKSpravEditOCENKA;
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
    begin
       DataPrKSpravView:=TDataPrKSpravOcenka.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                              DataSetPrKSprav.FieldValues['NAME'],
                                              DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                              StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                              DataSetPrKSprav.FieldValues['IS_SPIVBESIDA'],
                                              DataSetPrKSprav.FieldValues['IS_ZALIK'],
                                              DataSetPrKSprav.FieldValues['OCENKA_NUM']);

       T:=TFormPrKSpravEditOCENKA.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
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
       T.cxCheckBoxIsSpivbesida.Properties.ReadOnly  :=true;
       T.cxCheckBoxIsZalik.Properties.ReadOnly       :=true;
       T.cxSpinEditOcenka.Properties.ReadOnly        :=true;
       T.cxTextEditName.Style.Color      :=TextViewColor;
       T.cxTextEditShortName.Style.Color :=TextViewColor;
       T.cxTextEditKod.Style.Color       :=TextViewColor;
       T.cxTextEditNpp.Style.Color       :=TextViewColor;
       T.cxCheckBoxIsSpivbesida.Style.Color   :=TextViewColor;
       T.cxCheckBoxIsZalik.Style.Color        :=TextViewColor;
       T.cxSpinEditOcenka.Style.Color         :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;
end;

procedure TFormPRK_SP_OCENKA.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,7], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    ResultArray[5] :=DataSetPrKSprav.FieldValues['IS_SPIVBESIDA'];
    ResultArray[6] :=DataSetPrKSprav.FieldValues['IS_ZALIK'];
    ResultArray[7] :=DataSetPrKSprav.FieldValues['OCENKA_NUM'];
    close;
  end;
end;

end.
