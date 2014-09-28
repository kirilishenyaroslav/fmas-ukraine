unit UGetRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCalc, cxDropDownEdit, cxCalendar, ComCtrls, UParamsReestr, Ibase, DB,
  FIBDataSet, pFIBDataSet, ActnList, CnConsts;

type
  TfrmGetRec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    FacultyText: TcxButtonEdit;
    SpecialityText: TcxButtonEdit;
    FormTeatchText: TcxButtonEdit;
    GragdText: TcxButtonEdit;
    KategoryText: TcxButtonEdit;
    KursText: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SumValue: TcxCalcEdit;
    Label7: TLabel;
    Label8: TLabel;
    DateStart: TDateTimePicker;
    DefaultsDataSet: TpFIBDataSet;
    ActionList1: TActionList;
    ActionOk: TAction;
    ActionCancel: TAction;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SpecialityTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GragdTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KategoryTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KursTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionOkExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
    function CheckData:Boolean;
  public
    { Public declarations }
    Id_Faculty   :Int64;
    Id_Speciality:Int64;
    Id_FormTeatch:Int64;
    id_gragdanstv:Int64;
    id_Kategory  :Int64;
    id_Kurs      :Int64;
    constructor Create(AOwner:TComponent;RecInfo:TRecInfo;MinDate,MaxDate:TDateTime);reintroduce;
  end;

implementation

uses UGetParamValue, FIBDatabase;

{$R *.dfm}

procedure TfrmGetRec.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  0,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase,
                                  TfrmPriceReestr(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                FacultyText.Text      :=T.ResultText;
                Id_Faculty            :=T.ResultId;
                SpecialityText.Enabled:=true;
      end;
      T.Free;
end;

procedure TfrmGetRec.SpecialityTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  1,
                                  VarArrayOf([Id_Faculty]),
                                  TfrmPriceReestr(self.Owner).WorkDatabase,
                                  TfrmPriceReestr(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                SpecialityText.Text      :=T.ResultText;
                Id_Speciality            :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmGetRec.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  2,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase,
                                  TfrmPriceReestr(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                FormTeatchText.Text      :=T.ResultText;
                Id_FormTeatch            :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmGetRec.GragdTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  3,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase,
                                  TfrmPriceReestr(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                GragdText.Text      :=T.ResultText;
                id_gragdanstv       :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmGetRec.KategoryTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  4,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase,
                                  TfrmPriceReestr(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                KategoryText.Text      :=T.ResultText;
                id_Kategory       :=T.ResultId;
      end;
      T.Free;
end;

procedure TfrmGetRec.KursTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var T:TfrmGetParamValue;
begin
      T:=TfrmGetParamValue.Create(self,
                                  5,
                                  nil,
                                  TfrmPriceReestr(self.Owner).WorkDatabase,
                                  TfrmPriceReestr(self.Owner).ReadTransaction);
      if T.ShowModal=mrYes
      then begin
                KursText.Text      :=T.ResultText;
                id_Kurs            :=T.ResultId;
      end;
      T.Free;
end;

function TfrmGetRec.CheckData: Boolean;
 var Res:Boolean;
begin
     if (FacultyText.Text   <>'') and
        (SpecialityText.Text<>'') and
        (FormTeatchText.Text<>'') and
        (GragdText.Text     <>'') and
        (KategoryText.Text  <>'') and
        (KursText.Text      <>'')
     then Res:=true
     else begin
               Res:=false;
               ShowMessage('Не вибрані всі параметри ціни');
     end;

     Result:=Res;
end;

constructor TfrmGetRec.Create(AOwner: TComponent; RecInfo:TRecInfo;MinDate,MaxDate:TDateTime);
var ParamLength:Integer;

begin
     inherited Create(AOwner);
     DateStart.Date   :=MinDate;
     DateStart.MinDate:=MinDate;
     DateStart.MaxDate:=MaxDate;

   {  if (RecInfo<>nil)
     then begin
               ParamLength:=Length(RecInfo);
               if (ParamLength>=1)
               then begin
                         Id_Faculty:=RecInfo[0];
                       //  FacultyText.Text:=TfrmPriceReestr(AOwner).FacultyPath.Text;
               end
               else Id_Faculty:=-1;
               if (ParamLength>=2)
               then begin
                         Id_Speciality:=RecInfo[1];
//                         SpecialityText.Text:=TfrmPriceReestr(AOwner).SpecialityText.Text;
                         SpecialityText.Enabled:=true;
               end
               else Id_Speciality:=-1;
               if (ParamLength>=3)
               then begin
                          id_gragdanstv:=RecInfo[2];
//                          GragdText.Text:=TfrmPriceReestr(AOwner).GragdanstvoText.Text;
               end
               else id_gragdanstv:=-1;
               if (ParamLength>=4)
               then begin
                         Id_FormTeatch:=RecInfo[3];
//                         FormTeatchText.Text:=TfrmPriceReestr(AOwner).TeatchFormText.Text;
               end
               else Id_FormTeatch:=-1;
               if (ParamLength>=5)
               then begin
                         id_Kategory  :=RecInfo[4];
//                         KategoryText.Text:=TfrmPriceReestr(AOwner).KatTeatchText.Text;
               end
               else id_Kategory  :=-1;
               if (ParamLength>=6)
               then begin
                         id_Kurs      :=RecInfo[5];
//                         if (QueneLevelInfo(TfrmPriceReestr(AOwner).Quene.Peek).FLevel=5)
//                         then KursText.Text:=TfrmPriceReestr(AOwner).DataSet.FieldByName('NAME_KURS').AsString
//                         else KursText.Text:=TfrmPriceReestr(AOwner).KursText.Text;
               end
               else id_Kurs      :=-1;
     end
     else begin
               DefaultsDataSet.Database.Handle:=TfrmPriceReestr(AOwner).WorkDatabase.Handle;
               DefaultsDataSet.Transaction:=TfrmPriceReestr(AOwner).WriteTransaction;
               DefaultsDataSet.SelectSQL.Text:='SELECT * FROM CN_PRICES_DEFAULTS_SELECT';
               DefaultsDataSet.Open;

               id_faculty    :=-1;
               id_speciality :=-1;
               id_gragdanstv :=-1;
               Id_FormTeatch :=-1;
               id_kategory   :=-1;
               id_kurs       :=-1;

               if (DefaultsDataSet.RecordCount>0)
               then begin
                         if (DefaultsDataSet.FieldByName('ID_FACULTY').Value<>Null)
                         then begin
                                   FacultyText.Text:=DefaultsDataSet.FieldByName('TEXT_FACULTY').AsString;
                                   id_faculty      :=DefaultsDataSet.FieldByName('ID_FACULTY').Value;
                         end
                         else begin
                                   FacultyText.Text:='';
                         end;

                         if (DefaultsDataSet.FieldByName('ID_KATEGORY').Value<>Null)
                         then begin
                                   KategoryText.Text:=DefaultsDataSet.FieldByName('TEXT_KATEGORY').AsString;
                                   id_kategory      :=DefaultsDataSet.FieldByName('ID_KATEGORY').Value;
                         end
                         else begin
                                   KategoryText.Text:='';
                         end;

                         if (DefaultsDataSet.FieldByName('ID_SPECIALITY').Value<>Null)
                         then begin
                                   SpecialityText.Text:=DefaultsDataSet.FieldByName('TEXT_SPECIALITY').AsString;
                                   SpecialityText.Enabled:=true;
                                   id_speciality      :=DefaultsDataSet.FieldByName('ID_SPECIALITY').Value;
                         end
                         else begin
                                   SpecialityText.Text:='';
                         end;

                         if (DefaultsDataSet.FieldByName('ID_FORM_TEATCH').Value<>Null)
                         then begin
                                   FormTeatchText.Text:=DefaultsDataSet.FieldByName('TEXT_FORM_TEATCH').AsString;
                                   Id_FormTeatch      :=DefaultsDataSet.FieldByName('ID_FORM_TEATCH').Value;
                         end
                         else begin
                                   FormTeatchText.Text:='';
                         end;

                         if (DefaultsDataSet.FieldByName('ID_GRAGDANSTVO').Value<>Null)
                         then begin
                                   GragdText.Text      :=DefaultsDataSet.FieldByName('TEXT_GRAGDANSTVO').AsString;
                                   id_gragdanstv       :=DefaultsDataSet.FieldByName('ID_GRAGDANSTVO').Value;
                         end
                         else begin
                                   GragdText.Text:='';
                         end;

                         if (DefaultsDataSet.FieldByName('ID_KURS').Value<>Null)
                         then begin
                                   KursText.Text:=DefaultsDataSet.FieldByName('TEXT_KURS').AsString;
                                   id_kurs      :=DefaultsDataSet.FieldByName('ID_KURS').Value;
                         end
                         else begin
                                   KursText.Text:='';
                         end;
               end;
     end;}
end;


procedure TfrmGetRec.ActionOkExecute(Sender: TObject);
begin
  if CheckData then ModalResult:=mrYes;
end;

procedure TfrmGetRec.ActionCancelExecute(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

end.
