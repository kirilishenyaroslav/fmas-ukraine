unit UDefaults;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  DB, FIBDataSet, pFIBDataSet, pFibStoredProc;

type
  TfrmConfigureDefaults = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    FacultyText: TcxButtonEdit;
    SpecialityText: TcxButtonEdit;
    GrazdanstvoText: TcxButtonEdit;
    TeatchFormText: TcxButtonEdit;
    KategoryText: TcxButtonEdit;
    KursText: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DefaultssataSet: TpFIBDataSet;
    Label7: TLabel;
    SmetaText: TcxButtonEdit;
    Label8: TLabel;
    RazdelText: TcxButtonEdit;
    Label9: TLabel;
    StateText: TcxButtonEdit;
    Label10: TLabel;
    KekvText: TcxButtonEdit;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxButton11: TcxButton;
    cxButton12: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FacultyTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SpecialityTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GrazdanstvoTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TeatchFormTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KategoryTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KursTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SmetaTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KekvTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton12Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
    procedure cxButton11Click(Sender: TObject);
  private
    { Private declarations }
    id_faculty:Integer;
    id_speciality:integer;
    id_grazdanstvo:integer;
    id_teatchForm:integer;
    id_kategory:integer;
    id_kurs:integer;
    id_smeta:integer;
    id_razdel:integer;
    id_state:integer;
    id_kekv:integer;
  public
    { Public declarations }
    procedure SaveDefaults;
  end;



implementation

uses PricesMain, UGetParamValue, GlobalSPR;

{$R *.dfm}

procedure TfrmConfigureDefaults.cxButton1Click(Sender: TObject);
begin
     SaveDefaults;
     ModalResult:=mrYes;
end;

procedure TfrmConfigureDefaults.FormCreate(Sender: TObject);
begin
     DefaultssataSet.Database:=TfrmPricesMain(Owner).WorkDatabase;
     DefaultssataSet.Transaction:=TfrmPricesMain(Owner).ReadTransaction;
     DefaultssataSet.SelectSQL.Text:='SELECT * FROM CN_PRICES_DEFAULTS_SELECT';
     DefaultssataSet.Open;

     id_faculty    :=-1;
     id_speciality :=-1;
     id_grazdanstvo:=-1;
     id_teatchForm :=-1;
     id_kategory   :=-1;
     id_kurs       :=-1;
     id_smeta      :=-1;
     id_razdel     :=-1;
     id_state      :=-1;
     id_kekv       :=-1;

     if (DefaultssataSet.RecordCount>0)
     then begin
               if (DefaultssataSet.FieldByName('ID_FACULTY').Value<>Null)
               then begin
                         FacultyText.Text:=DefaultssataSet.FieldByName('TEXT_FACULTY').AsString;
                         id_faculty      :=DefaultssataSet.FieldByName('ID_FACULTY').Value;
               end
               else begin
                         FacultyText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_KATEGORY').Value<>Null)
               then begin
                         KategoryText.Text:=DefaultssataSet.FieldByName('TEXT_KATEGORY').AsString;
                         id_kategory     :=DefaultssataSet.FieldByName('ID_KATEGORY').Value;
               end
               else begin
                         KategoryText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_SPECIALITY').Value<>Null)
               then begin
                         SpecialityText.Text:=DefaultssataSet.FieldByName('TEXT_SPECIALITY').AsString;
                         SpecialityText.Enabled:=true;
                         id_speciality      :=DefaultssataSet.FieldByName('ID_SPECIALITY').Value;
               end
               else begin
                         SpecialityText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_FORM_TEATCH').Value<>Null)
               then begin
                         TeatchFormText.Text:=DefaultssataSet.FieldByName('TEXT_FORM_TEATCH').AsString;
                         id_teatchForm      :=DefaultssataSet.FieldByName('ID_FORM_TEATCH').Value;
               end
               else begin
                         TeatchFormText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_GRAGDANSTVO').Value<>Null)
               then begin
                         GrazdanstvoText.Text:=DefaultssataSet.FieldByName('TEXT_GRAGDANSTVO').AsString;
                         id_teatchForm       :=DefaultssataSet.FieldByName('ID_GRAGDANSTVO').Value;
               end
               else begin
                         TeatchFormText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_KURS').Value<>Null)
               then begin
                         KursText.Text:=DefaultssataSet.FieldByName('TEXT_KURS').AsString;
                         id_kurs      :=DefaultssataSet.FieldByName('ID_KURS').Value;
               end
               else begin
                         KursText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_SMETA').Value<>Null)
               then begin
                         SmetaText.Text:=DefaultssataSet.FieldByName('TEXT_SMETA').AsString;
                         ID_SMETA      :=DefaultssataSet.FieldByName('ID_SMETA').Value;
               end
               else begin
                         SmetaText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_RAZDEL').Value<>Null)
               then begin
                         RazdelText.Text:=DefaultssataSet.FieldByName('TEXT_RAZDEL').AsString;
                         ID_RAZDEL      :=DefaultssataSet.FieldByName('ID_RAZDEL').Value;
               end
               else begin
                         RazdelText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_STAT').Value<>Null)
               then begin
                         StateText.Text:=DefaultssataSet.FieldByName('TEXT_STAT').AsString;
                         id_state      :=DefaultssataSet.FieldByName('ID_STAT').Value;
               end
               else begin
                         StateText.Text:='';
               end;

               if (DefaultssataSet.FieldByName('ID_KEKV').Value<>Null)
               then begin
                         KekvText.Text:=DefaultssataSet.FieldByName('TEXT_KEKV').AsString;
                         id_kekv      :=DefaultssataSet.FieldByName('ID_KEKV').Value;
               end
               else begin
                         KekvText.Text:='';
               end;

     end;
end;

procedure TfrmConfigureDefaults.FacultyTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                     0,
                                     nil,
                                     TfrmPricesMain(self.Owner).WorkDatabase,
                                     TfrmPricesMain(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                FacultyText.Text      :=T.ResultText;
                Id_Faculty            :=T.ResultId;
                SpecialityText.Enabled:=true;
      end;
      T.Free;
end;

procedure TfrmConfigureDefaults.SpecialityTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                     1,
                                     VarArrayOf([id_faculty]),
                                     TfrmPricesMain(self.Owner).WorkDatabase,
                                     TfrmPricesMain(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                SpecialityText.Text      :=T.ResultText;
                id_speciality            :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmConfigureDefaults.GrazdanstvoTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                     3,
                                     nil,
                                     TfrmPricesMain(self.Owner).WorkDatabase,
                                     TfrmPricesMain(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                GrazdanstvoText.Text      :=T.ResultText;
                id_grazdanstvo            :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmConfigureDefaults.TeatchFormTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                     2,
                                     nil,
                                     TfrmPricesMain(self.Owner).WorkDatabase,
                                     TfrmPricesMain(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                TeatchFormText.Text      :=T.ResultText;
                id_teatchForm            :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmConfigureDefaults.KategoryTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                     4,
                                     nil,
                                     TfrmPricesMain(self.Owner).WorkDatabase,
                                     TfrmPricesMain(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                KategoryText.Text      :=T.ResultText;
                id_kategory            :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmConfigureDefaults.KursTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                     5,
                                     nil,
                                     TfrmPricesMain(self.Owner).WorkDatabase,
                                     TfrmPricesMain(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                KursText.Text      :=T.ResultText;
                id_kurs            :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmConfigureDefaults.SmetaTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var id:Variant;
begin
    id:=GlobalSPR.GetSmets(self,
                           TfrmPricesMain(self.Owner).WorkDatabase.Handle,
                           Date,
                           psmRazdSt);
    if (VarArrayDimCount(id)>0)
    then begin
              id_smeta :=id[0];
              id_razdel:=id[1];
              id_state :=id[2];
              SmetaText.Text:=VarToStr(id[9])+' "'+VarToStr(id[6])+'"';
              RazdelText.Text:=VarToStr(id[7])+' "'+VarToStr(id[4])+'"';
              StateText.Text:=VarToStr(id[8])+' "'+VarToStr(id[5])+'"';
    end;
end;

procedure TfrmConfigureDefaults.KekvTextPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var id:Variant;
begin
    id:=GlobalSpr.GetKEKVSpr(self,
                             TfrmPricesMain(self.Owner).WorkDatabase.Handle,
                             fsNormal,
                             Date,
                             DEFAULT_ROOT_ID);
    if (VarArrayDimCount(id)>0)
    then begin
              id_kekv:=id[0][0];
              KekvText.Text:=VarToStr(id[0][2])+' "'+VarToStr(id[0][1])+'"';
    end;
end;

procedure TfrmConfigureDefaults.SaveDefaults;
  var SaveStoredProc:TpFibStoredProc;
begin
      SaveStoredProc:=TpFibStoredProc.Create(self);
      SaveStoredProc.Database:=TfrmPricesMain(self.Owner).WorkDatabase;
      SaveStoredProc.Transaction:=TfrmPricesMain(self.Owner).WriteTransaction;
      TfrmPricesMain(self.Owner).WriteTransaction.StartTransaction;
      SaveStoredProc.StoredProcName:='CN_PRICES_DEFAULTS_INS_UPD';
      SaveStoredProc.Prepare;

      if (id_faculty<>-1)
      then SaveStoredProc.ParamByName('ID_FACULTY').Value    :=id_faculty
      else SaveStoredProc.ParamByName('ID_FACULTY').Value    :=NULL;

      if (id_kategory<>-1)
      then SaveStoredProc.ParamByName('ID_KATEGORY').Value   :=id_kategory
      else SaveStoredProc.ParamByName('ID_KATEGORY').Value   :=NULL;

      if (id_speciality<>-1)
      then SaveStoredProc.ParamByName('ID_SPECIALITY').Value :=id_speciality
      else SaveStoredProc.ParamByName('ID_SPECIALITY').Value :=NULL;

      if (id_teatchForm<>-1)
      then SaveStoredProc.ParamByName('ID_FORM_TEATCH').Value:=id_teatchForm
      else SaveStoredProc.ParamByName('ID_FORM_TEATCH').Value:=NULL;

      if (id_grazdanstvo<>-1)
      then SaveStoredProc.ParamByName('ID_GRAGDANSTVO').Value:=id_grazdanstvo
      else SaveStoredProc.ParamByName('ID_GRAGDANSTVO').Value:=NULL;

      if (id_kurs<>-1)
      then SaveStoredProc.ParamByName('ID_KURS').Value       :=id_kurs
      else SaveStoredProc.ParamByName('ID_KURS').Value       :=NULL;

      if (id_smeta<>-1)
      then SaveStoredProc.ParamByName('ID_SMETA').Value      :=id_smeta
      else SaveStoredProc.ParamByName('ID_SMETA').Value      :=NULL;

      if (id_razdel<>-1)
      then SaveStoredProc.ParamByName('ID_RAZDEL').Value     :=id_razdel
      else SaveStoredProc.ParamByName('ID_RAZDEL').Value     :=NULL;

      if (id_state<>-1)
      then SaveStoredProc.ParamByName('ID_STAT').Value       :=id_state
      else SaveStoredProc.ParamByName('ID_STAT').Value       :=NULL;

      if (id_kekv<>-1)
      then SaveStoredProc.ParamByName('ID_KEKV').Value       :=id_kekv
      else SaveStoredProc.ParamByName('ID_KEKV').Value       :=NULL;

      SaveStoredProc.ExecProc;

      TfrmPricesMain(self.Owner).WriteTransaction.Commit;

      SaveStoredProc.Free;
end;

procedure TfrmConfigureDefaults.cxButton12Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmConfigureDefaults.cxButton2Click(Sender: TObject);
begin
     FacultyText.Clear;
     id_faculty:=-1;
     SpecialityText.Clear;
     SpecialityText.Enabled:=false;
     id_speciality:=-1;
end;

procedure TfrmConfigureDefaults.cxButton3Click(Sender: TObject);
begin
     if SpecialityText.Enabled
     then begin
               SpecialityText.Clear;
               id_speciality:=-1;
     end;
end;

procedure TfrmConfigureDefaults.cxButton4Click(Sender: TObject);
begin
     GrazdanstvoText.Clear;
     id_grazdanstvo:=-1;
end;

procedure TfrmConfigureDefaults.cxButton5Click(Sender: TObject);
begin
     TeatchFormText.Clear;
     id_teatchForm:=-1;
end;

procedure TfrmConfigureDefaults.cxButton6Click(Sender: TObject);
begin
     KategoryText.Clear;
     id_kategory:=-1;
end;

procedure TfrmConfigureDefaults.cxButton7Click(Sender: TObject);
begin
     KursText.Clear;
     id_kurs:=-1;
end;

procedure TfrmConfigureDefaults.cxButton8Click(Sender: TObject);
begin
     id_smeta:=-1;
     SmetaText.Clear;
end;

procedure TfrmConfigureDefaults.cxButton9Click(Sender: TObject);
begin
     RazdelText.Clear;
     id_razdel:=-1;
end;

procedure TfrmConfigureDefaults.cxButton10Click(Sender: TObject);
begin
     StateText.Clear;
     id_state:=-1;
end;

procedure TfrmConfigureDefaults.cxButton11Click(Sender: TObject);
begin
     KekvText.Clear;
     id_kekv:=-1;
end;

end.
