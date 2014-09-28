unit uAddShabloni_Prov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxLabel, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxButtonEdit, ibase, StdCtrls,uShabloni_Prov, GlobalSPR,
  FIBDatabase, pFIBDatabase, AllPeopleUnit, cxLookAndFeelPainters,
  ActnList,Constant_for_Shabloni, cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc,
  DB, pFIBDataSet, {GlobalSPR сметы, разделы, статьи,  ≈ Ё, счета}
  FIBDataSet;

type
  TFormAddShabloniProv = class(TForm)
    cxLabelKOD_DOG: TcxLabel;
    cxLabelSUMMA: TcxLabel;
    cxButtonEditKOD_DOG: TcxButtonEdit;
    GroupBoxDannie_O_provodke: TGroupBox;
    cxLabelSMETA_TITLE: TcxLabel;
    cxLabelNomerStatiy: TcxLabel;
    cxLabelKEKV_KOD: TcxLabel;
    cxLabelKEKV_TITLE: TcxLabel;
    cxButtonEditSMETA_TITLE: TcxButtonEdit;
    cxButtonEditKEKV_TITLE: TcxButtonEdit;
    cxLabelSmetaKod: TcxLabel;
    cxLabelNomer_Razdela: TcxLabel;
    cxTextEditSmetaKod: TcxTextEdit;
    cxLabelNameRazdela: TcxLabel;
    cxTextEditNomer_Razdela: TcxTextEdit;
    cxLabelNameStatii: TcxLabel;
    cxButtonEditNameStatii: TcxButtonEdit;
    cxTextEditNomerStatiy: TcxTextEdit;
    cxButtonEditNameRazdela: TcxButtonEdit;
    cxTextEditKEKV_KOD: TcxTextEdit;
    GroupBoxLichDannie: TGroupBox;
    cxButtonEditFIO: TcxButtonEdit;
    cxLabelFio: TcxLabel;
    cxTextEditName_Shablona: TcxTextEdit;
    cxLabelName_Shablona: TcxLabel;
    cxLabelKod_Shablona: TcxLabel;
    cxTextEditKod_Shablona: TcxTextEdit;
    cxLabelSCH_NUMBER: TcxLabel;
    cxTextEditSCH_NUMBER: TcxTextEdit;
    cxLabelSCH_TITLE: TcxLabel;
    cxButtonEditSCH_TITLE: TcxButtonEdit;
    cxButtonAdd: TcxButton;
    cxButtonOtmena: TcxButton;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionExit: TAction;
    GroupBoxVisible: TGroupBox;
    CheckBoxVisibleKassa: TCheckBox;
    CheckBoxVisibleBank: TCheckBox;
    CheckBoxVisibleAvance: TCheckBox;
    ActionClear: TAction;
    cxTextEditSUMMA: TcxTextEdit;
    procedure cxButtonEditSMETA_TITLEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditNameRazdelaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditNameStatiiPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditKEKV_TITLEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSCH_TITLEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditFIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionAddExecute(Sender: TObject);
    procedure Inicalication_param_for_Change(aAdd_Change: Smallint{0-Add,1-Change};aId_shablon: Smallint);
    procedure InicCaptionAddProv(aAdd_Change: Smallint{0-Add,1-Change});
    procedure ActionExitExecute(Sender: TObject);
    procedure cxTextEditSUMMAKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditKod_ShablonaKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditKOD_DOGPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    today :TDate;
    id_Shablon, id_smet,id_razdel,id_statiya,id_gryppa_smet,id_kekv,id_SCH,id_Man,id_dog: Int64;
    Kod_Shablona,Kod_dog: Int64;
    pos_for_people: Integer;
    Name_Shablona :STRING;
    Vis_Kassa,Vis_Bank,Vis_Avance,Add_Change: Smallint;
    Summa: Double;
  public
    my_ShablonForm : TForm_Shabloni_Prov;
  end;
     function GetParamAdd_Shabloni(AOwner:TComponent;aAdd_Change: Smallint{0-Add,1-Change};aId_shablon: Smallint ): variant; stdcall;

implementation

uses DogLoaderUnit;

{$R *.dfm}

function GetParamAdd_Shabloni(AOwner:TComponent;aAdd_Change: Smallint{0-Add,1-Change};aId_shablon: Smallint): variant;
var
    t: TFormAddShabloniProv;
begin
    t := TFormAddShabloniProv.Create(aowner);
    t.InicCaptionAddProv(aAdd_Change);
    t.Inicalication_param_for_Change(aAdd_Change,aId_shablon);
    t.ShowModal;
    t.Free ;
end;


procedure TFormAddShabloniProv.cxButtonEditSMETA_TITLEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res   : Variant;
begin
   res := GlobalSPR.GetSmets(self,TForm_Shabloni_Prov(self.Owner).pFIBDatabaseShabloni_Prov.Handle,today, psmRazdSt);
      if VarArrayDimCount(res) > 0 then
      begin
          if (res[0] <> 0) and(res[1] <> 0)and(res[2] <> 0) then
          begin
              id_smet       :=res[0];
              id_razdel     :=res[1];
              id_statiya    :=res[2];
                   // id_gryppa_smet:=res[3];
              cxButtonEditNameRazdela.Text:=res[4];
              cxButtonEditNameStatii.Text :=res[5];
              cxButtonEditSMETA_TITLE.text:=res[6];
              cxTextEditNomer_Razdela.Text:=res[7];
              cxTextEditNomerStatiy.Text  :=res[8];
              cxTextEditSmetaKod.Text     :=res[9];
          end;
      end;

end;

procedure TFormAddShabloniProv.cxButtonEditNameRazdelaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res :variant;
begin
  res := GlobalSPR.GetSmets(self, TForm_Shabloni_Prov(self.Owner).pFIBDatabaseShabloni_Prov.Handle, today, psmRazdSt);
    if VarArrayDimCount(res) > 0 then
      begin
          if (res[1] <> 0) then
          begin
              id_razdel     :=res[1];
              cxButtonEditNameRazdela.Text:=res[4];
              cxTextEditNomer_Razdela.Text:=res[7];
          end;
      end;
end;

procedure TFormAddShabloniProv.cxButtonEditNameStatiiPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res   : Variant;
begin
   res := GlobalSPR.GetSmets(self, TForm_Shabloni_Prov(self.Owner).pFIBDatabaseShabloni_Prov.Handle,today, psmRazdSt);
      if VarArrayDimCount(res) > 0 then
      begin
          if (res[2] <> 0) then
          begin
              id_statiya    :=res[2];
              cxButtonEditNameStatii.Text :=res[5];
              cxTextEditNomerStatiy.Text  :=res[8];
          end;
      end;

end;

procedure TFormAddShabloniProv.cxButtonEditKEKV_TITLEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := GlobalSPR.GetKEKVSpr(self, TForm_Shabloni_Prov(self.Owner).pFIBDatabaseShabloni_Prov.Handle, fsNormal, today, 1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][0]<>null) and (res[0][1]<>null) then
        begin
            id_kekv                      := res[0][0];
            cxButtonEditKEKV_TITLE.Text  := res[0][1];
            cxTextEditKEKV_KOD.Text      := res[0][2];
        end;
    end;
end;

procedure TFormAddShabloniProv.cxButtonEditSCH_TITLEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := GlobalSPR.GetSch(self, TForm_Shabloni_Prov(self.Owner).pFIBDatabaseShabloni_Prov.Handle, fsNormal, today, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_SCH                     := res[0][0];
            cxButtonEditSCH_TITLE.Text := res[0][1];
            cxTextEditSCH_NUMBER.Text  := res[0][3];

        end;
    end;
end;

procedure TFormAddShabloniProv.cxButtonEditFIOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res :=AllPeopleUnit.GetMan(Self,TForm_Shabloni_Prov(self.Owner).pFIBDatabaseShabloni_Prov.Handle,False,False,pos_for_people);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            id_Man                     := res[0];
            cxButtonEditFIO.Text       := res[1];
        end;
    end;
end;

procedure TFormAddShabloniProv.ActionAddExecute(Sender: TObject);
var
    nameprocedure: string;
    id : int64;
begin

   if CheckBoxVisibleKassa.Checked=true  then Vis_Kassa:=1
                                         else Vis_Kassa:=0;
   if CheckBoxVisibleBank.Checked=true   then Vis_Bank:=1
                                         else Vis_Bank:=0;
   if CheckBoxVisibleAvance.Checked=true then Vis_Avance:=1
                                         else Vis_Avance:=0;
   if (cxTextEditName_Shablona.Text='') and (cxTextEditKod_Shablona.Text='')
      then begin
         ShowMessage('Imya');
         Exit;
      end;
   if (Vis_Kassa=0) and (Vis_Bank=0) and (Vis_Avance=0)
      then begin
         ShowMessage('Vusible');
         Exit;
      end;
   if (cxTextEditSmetaKod.Text='')     and (cxTextEditNomer_Razdela.Text='') and (cxTextEditNomerStatiy.Text='')
      and (cxTextEditKEKV_KOD.Text='') and (cxButtonEditKOD_DOG.Text='')     and (cxTextEditSUMMA.Text='')
      and (cxButtonEditFIO.Text='')    and (cxTextEditSCH_NUMBER.Text='')
       then begin
           ShowMessage('Ostalnoe');
           exit;
       end;

         if  Add_Change=0 then  nameprocedure:='PUB_SP_PROV_ADD'
                          else  nameprocedure:='PUB_SP_PROV_CHANGE';
         {pFIBStoredProcShablon.Transaction.StartTransaction;
         pFIBStoredProcShablon.StoredProcName:=nameprocedure;   // pFIBStoredProcShablon.Params.clear;
         pFIBStoredProcShablon.Prepare; }
         TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.Transaction.StartTransaction;
         TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.StoredProcName:=nameprocedure;
         TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.Prepare;
         if Add_Change=1 then
         begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_TABLE_PUB_SP_PROV').AsInt64 :=id_Shablon;
            id := id_Shablon;
         end;

         if cxTextEditName_Shablona.Text<>''then begin
            Name_Shablona := cxTextEditName_Shablona.Text;
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('NAME_SHABLON_PROVODKI').AsString :=Name_Shablona;
            end;
         if cxTextEditKod_Shablona.Text<>'' then begin
            Kod_Shablona  := StrToInt64(cxTextEditKod_Shablona.Text);
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('KOD_SHABLONA').AsInt64           :=Kod_Shablona;
            end;

         TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('VISIBLE_KASSA').AsShort             :=Vis_Kassa;
         TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('VISIBLE_BANK').AsShort              :=Vis_Bank;
         TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('VISIBLE_AVANCE').AsShort            :=Vis_Avance;

         if cxButtonEditFIO.Text<>'' then begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_MAN').AsInt64                 :=id_Man;
            end;
         if cxButtonEditSCH_TITLE.Text<>'' then begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_SCHET').AsInt64               :=id_SCH;
            end;
         if cxButtonEditSMETA_TITLE.Text<>'' then begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_SMETA').AsInt64               :=id_smet;
            end;
         if cxButtonEditNameRazdela.Text<>'' then begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_RAZDEL').AsInt64              :=id_razdel;
            end;
         if cxButtonEditNameStatii.Text<>'' then begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_STATIYA').AsInt64             :=id_statiya;
            end;
         if cxButtonEditKEKV_TITLE.Text<>'' then begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_KEKV').AsInt64                :=id_kekv;
            end;
         if cxButtonEditKOD_DOG.Text<>'' then begin
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('ID_DOG').AsInt64                 :=id_dog;
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('KOD_DOG').AsInt64                :=Kod_dog;
         end;
         if cxTextEditSUMMA.Text<>''then begin
            Summa := StrToFloat(cxTextEditSUMMA.Text);
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ParamByName('SUMMA').AsDouble                 :=Summa;
         end;
         try
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.ExecProc;
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.Transaction.Commit;
         Except
            TForm_Shabloni_Prov(self.Owner).pFIBStoredProcShablon.Transaction.Rollback;
         end;
         TForm_Shabloni_Prov(self.Owner).Inicalisation(TForm_Shabloni_Prov(self.Owner).Vis_Kassa, TForm_Shabloni_Prov(self.Owner).Vis_Bank, TForm_Shabloni_Prov(self.Owner).Vis_Avanse);
         if Add_Change=1 then
             TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.Locate('ID_TABLE_PUB_SP_PROV', id, []);
    Close;
end;

procedure TFormAddShabloniProv.Inicalication_param_for_Change(aAdd_Change: Smallint{0-Add,1-Change};aId_shablon: Smallint);
begin
    today:=Date;
    pos_for_people:=0;
    Add_Change:=aAdd_Change;
    if Add_Change>0 then
    begin
       id_Shablon:=aId_shablon;
       cxTextEditName_Shablona.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['NAME_SHABLON_PROVODKI']);
       cxTextEditKod_Shablona.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['KOD_SHABLONA']);
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_MAN']<>Null then begin
         id_Man:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_MAN'];
         pos_for_people:=id_Man;
         cxButtonEditFIO.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['FIO_MAN'])+' '+VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['IMYA_MAN'])+' '+VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['OTCHESTVO_MAN']);
       end;
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_SCHET']<>Null then begin
         id_SCH:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_SCHET'];
         cxButtonEditSCH_TITLE.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['SCH_TITLE']);
         cxTextEditSCH_NUMBER.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['SCH_NUMBER']);
       end;
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_SMETA']<>Null then begin
         id_smet:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_SMETA'];
         cxButtonEditSMETA_TITLE.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['SMETA_TITLE']);
         cxTextEditSmetaKod.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['SMETA_KOD']);
       end;
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_RAZDEL']<>Null then begin
         id_razdel:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_RAZDEL'];
         cxButtonEditNameRazdela.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['RAZDEL_TITLE']);
         cxTextEditNomer_Razdela.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['RAZDEL_NUM']);
       end;
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_STATIYA']<>NULL then begin
         id_statiya:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_STATIYA'];
         cxButtonEditNameStatii.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['STATIYA_TITLE']);
         cxTextEditNomerStatiy.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ST_NUM']);
       end;
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_KEKV']<>Null then begin
         id_kekv:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_KEKV'];
         cxButtonEditKEKV_TITLE.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['KEKV_TITLE']);
         cxTextEditKEKV_KOD.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['KEKV_KOD']);
       end;
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_DOG']<>Null then begin
         id_dog:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['ID_DOG'];
         cxButtonEditKOD_DOG.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['KOD_DOG']);
       end;
       if TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['SUMMA']<>Null then begin
         Summa:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['SUMMA'];
         cxTextEditSUMMA.Text:=VarToStr(TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['SUMMA']);
       end;
       Vis_Kassa:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['VISIBLE_KASSA'];
       Vis_Bank:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['VISIBLE_BANK'];
       Vis_Avance:=TForm_Shabloni_Prov(self.Owner).pFIBDataSetShabloni_Prov.FieldValues['VISIBLE_AVANCE'];
       if Vis_Kassa=1
          then CheckBoxVisibleKassa.Checked:=true
          else CheckBoxVisibleKassa.Checked:=false;
       if Vis_Bank=1
          then CheckBoxVisibleBank.Checked:=true
          else CheckBoxVisibleBank.Checked:=false;
       if Vis_Avance=1
          then CheckBoxVisibleAvance.Checked:=true
          else CheckBoxVisibleAvance.Checked:=false;
    end;
end;

procedure TFormAddShabloniProv.InicCaptionAddProv(aAdd_Change: Smallint{0-Add,1-Change});
begin
   if aAdd_Change=1 then begin
                    TFormAddShabloniProv(self).Caption:=nCaptionChangeShabloni;
                    ActionAdd.Caption:=nButt_Change;
                    ActionAdd.Hint:=nHintButt_Change;
                    end
                    else begin
                    TFormAddShabloniProv(self).Caption:=nCaptionAddShabloni;
                    ActionAdd.Caption:=nButt_Add;
                    ActionAdd.Hint:=nHintButt_Add;
                    end;
   ActionExit.Caption:=nButt_Otmena;
   ActionExit.Hint:=nHintButt_Otmena;

   GroupBoxLichDannie.Caption:=nGroupBoxLichDannie;
   GroupBoxDannie_O_provodke.Caption:=nGroupBoxDanne_O_prov;
   GroupBoxVisible.Caption:=nGroupBoxVisible;
   CheckBoxVisibleKassa.Caption:=nVis_kassa;
   CheckBoxVisibleBank.Caption:=nVis_bank;
   CheckBoxVisibleAvance.Caption:=nVis_avance;

   cxLabelName_Shablona.Caption:=nName_shablona;
   cxLabelKod_Shablona.Caption:=nKod_shablona;
   cxLabelFio.Caption:=nFioMan;
   cxLabelSCH_TITLE.Caption:=nSCH_title;
   cxLabelSCH_NUMBER.Caption:=nSCH_Number;
   cxLabelSMETA_TITLE.Caption:=nSmeta_title;
   cxLabelSmetaKod.Caption:=nSmeta_Kod;
   cxLabelNameRazdela.Caption:=nRazdel_title;
   cxLabelNomer_Razdela.Caption:=nRazdel_Num;
   cxLabelNameStatii.Caption:=nStatiya_title;
   cxLabelNomerStatiy.Caption:=nStatiya_Num;
   cxLabelKEKV_TITLE.Caption:=nKekv_title;
   cxLabelKEKV_KOD.Caption:=nKekv_kod;
   cxLabelKOD_DOG.Caption:=nKod_dog;
   cxLabelSUMMA.Caption:=nSumma;

end;

procedure TFormAddShabloniProv.ActionExitExecute(Sender: TObject);
begin
  close;
end;

procedure TFormAddShabloniProv.cxTextEditSUMMAKeyPress(Sender: TObject;
  var Key: Char);
begin
    if cxTextEditSUMMA.Text = '0,000' then cxTextEditSUMMA.Text := '';

    if (Key = '.') or (Key=',') then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSUMMA.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSUMMA.Text) - Pos(DecimalSeparator, cxTextEditSUMMA.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSUMMA.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TFormAddShabloniProv.cxTextEditKod_ShablonaKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (Key = '.') or (Key=',') then Key :=Chr(0);
  if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0);
end;

procedure TFormAddShabloniProv.cxButtonEditKOD_DOGPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    summa_dog : double;
    i, j : integer;
    input_1 : TDogInput;
    res   : TDogResult;
begin
        SYS_ID_USER          := TForm_Shabloni_Prov(self.Owner).id_user;
        decimalseparator     := ',';
        input_1              := SYS_DEFAULT_DOG_INPUT;
        input_1.Owner        := Self;
        input_1.DBHandle     := TForm_Shabloni_Prov(self.Owner).pFIBDatabaseShabloni_Prov.Handle;
        input_1.ReadTrans    := TForm_Shabloni_Prov(self.Owner).pFIBTransactionRead.Handle;
        input_1.WriteTrans   := TForm_Shabloni_Prov(self.Owner).pFIBTransactionWrite.Handle;
        input_1.FormStyle    := fsNormal;
//        if  then
        begin
            TForm_Shabloni_Prov(self.Owner).DataSet.Close;
            TForm_Shabloni_Prov(self.Owner).DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
            TForm_Shabloni_Prov(self.Owner).DataSet.Open;
//            if prih = 1
//                then input_1.id_Group_add := TForm_Shabloni_Prov(self.Owner).DataSet.FieldByName('ID_GROUP_ADD_PR').AsInteger//61799//1499
                {else} input_1.id_Group_add := TForm_Shabloni_Prov(self.Owner).DataSet.FieldByName('ID_GROUP_ADD_RAS').AsInteger;//61799;//1599;
            input_1.id_Group     := TForm_Shabloni_Prov(self.Owner).DataSet.FieldByName('ID_GROUP').AsInteger;//61699;//699;
            TForm_Shabloni_Prov(self.Owner).DataSet.Close;
        end;
        input_1.filter.bShowFilterForm := true;
        input_1.isZayav     := false;
        input_1.arndGetPay  := 1;
        res := ShowDogMain(input_1);
        if res.ModalResult = 1 then
        begin
            cxButtonEditKOD_DOG.Text := VarToStr(res.name_tip_dog) + ' '+ VarToStr(res.n_dog) + ' ' + VarToStr(res.d_dog) + ' ' + VarToStr(res.regest_num) + ' ' + VarToStr(res.name_customer);
            id_dog  := res.id_dog;
            kod_dog := res.kod_dog;
        end;
end;

end.

