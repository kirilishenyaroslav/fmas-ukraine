unit AddDogSpecUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, IBASE,
  cxMemo, dogLoaderUnit, Math;

type
  TfrmAddSpec = class(TForm)
    MatEdit: TcxButtonEdit;
    TopPricePercentEdit: TcxTextEdit;
    BottomPricePercentEdit: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    LastPriceEdit: TcxTextEdit;
    cxLabel7: TcxLabel;
    CommentEdit: TcxMemo;
    cxLabel8: TcxLabel;
    MatEdit2: TcxButtonEdit;
    lbShablon: TcxLabel;
    VolumeEdit: TcxTextEdit;
    cxLabel9: TcxLabel;
    SummaEdit: TcxTextEdit;
    lbSumma: TcxLabel;
    lbSummaNDS: TcxLabel;
    SummaNDSEdit: TcxTextEdit;
    PlanPriceEdit: TcxTextEdit;
    BottomPriceEdit: TcxTextEdit;
    TopPriceEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure PlanPriceEditPropertiesChange(Sender: TObject);
    procedure TopPricePercentEditPropertiesChange(Sender: TObject);
    procedure BottomPricePercentEditPropertiesChange(Sender: TObject);
    procedure MatEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SummaEditPropertiesChange(Sender: TObject);
    procedure VolumeEditPropertiesChange(Sender: TObject);
  public
    db_handle, r_trans, w_trans : TISC_DB_HANDLE;
    id_material : int64;
    id_shablon  : int64;
    sel_mode : integer;
    procedure CalcTopPrice;
    procedure CalcBottomPrice;
    procedure CalcCost;
  end;

 TSpravFuncN = function (aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aFS: TFormStyle; aID_USER : INT64;
                       aID_NOMN: int64; aID_PROP: int64; aNType: integer; aMView: integer; aMSelect:integer; aLang: integer =0):Variant;stdcall;

var
  frmAddSpec: TfrmAddSpec;

implementation

{$R *.dfm}

procedure TfrmAddSpec.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : TSpravFuncN;
 Res:Variant;
begin
 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage('SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, db_handle, fsNormal, 0, 0, 0, 0, 0, sel_mode, 0);
 end else begin
  ShowMessage(PChar('ќшибка загрузки номенклатора'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
   id_material := Res[0];
   MatEdit.Text := Res[1];
//   PlanPriceEdit.Text := FloatToStr(Res[4]);
 end;
end;

procedure TfrmAddSpec.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmAddSpec.cxButton1Click(Sender: TObject);
var
 tmp : Extended;
begin
 if (id_material = -1) and (MatEdit.Visible) then
 begin
   ShowMessage('¬кажить матер≥ал');
   exit;
 end;
 if (id_shablon = -1) and (MatEdit2.Visible) then
 begin
   ShowMessage('¬кажить шаблон');
   exit;
 end;
 if not TryStrToFloat(TopPricePercentEdit.Text, tmp) then
 begin
   ShowMessage('¬кажить верхн≥й в≥дсоток');
   exit;
 end;
 if not TryStrToFloat(BottomPricePercentEdit.Text, tmp) then
 begin
   ShowMessage('¬кажить нижн≥й в≥дсоток');
   exit;
 end;
 if not TryStrToFloat(LastPriceEdit.Text, tmp) then
 begin
   ShowMessage('¬кажить останню ц≥ну');
   exit;
 end;
 if not TryStrToFloat(VolumeEdit.Text, tmp) then
 begin
   ShowMessage('¬кажить останню ц≥ну');
   exit;
 end;
 ModalResult := mrOk;
end;

procedure TfrmAddSpec.CalcBottomPrice;
var
 sum : Extended;
 Bottom_perc : Extended;
begin
 if not TryStrToFloat(PlanPriceEdit.Text, sum) then
 begin
   BottomPriceEdit.Text := '';
   exit;
 end;
 if TryStrToFloat(BottomPricePercentEdit.Text, Bottom_perc) then BottomPriceEdit.Text := FloatToStr(sum + sum * Bottom_perc / 100)
                                                      else BottomPriceEdit.Text := FloatToStr(sum);
end;

procedure TfrmAddSpec.CalcTopPrice;
var
 sum : Extended;
 top_perc : Extended;
begin
 if not TryStrToFloat(PlanPriceEdit.Text, sum) then
 begin
   TopPriceEdit.Text := '';
   exit;
 end;
 if TryStrToFloat(TopPricePercentEdit.Text, top_perc) then TopPriceEdit.Text := FloatToStr(sum + sum * top_perc / 100)
                                                      else TopPriceEdit.Text := FloatToStr(sum);
end;

procedure TfrmAddSpec.PlanPriceEditPropertiesChange(Sender: TObject);
begin
 CalcTopPrice;
 CalcBottomPrice;
end;

procedure TfrmAddSpec.TopPricePercentEditPropertiesChange(Sender: TObject);
begin
 CalcTopPrice;
end;

procedure TfrmAddSpec.BottomPricePercentEditPropertiesChange(
  Sender: TObject);
begin
 CalcBottomPrice;
end;

procedure TfrmAddSpec.MatEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 i, o : DogLoaderUnit.TSpravParams;
begin
  i := DogLoaderUnit.TSpravParams.Create;
  o := DogLoaderUnit.TSpravParams.Create;

  i['DataBase']  := Integer(db_handle);
  i['ReadTransaction'] := Integer(r_trans);
  i['WriteTransaction'] := Integer(w_trans);
  i['FormStyle'] := fsNormal;

  DogLoaderUnit.LoadSprav('workdog\matShablons.bpl', Self, i, o);

  if o['ModalResult'] = mrOk then
  begin
    MatEdit2.Text := o['NAME_SHABLON'];
    id_shablon := o['ID_SHABLON'];
  end;  
  i.Free;
  o.Free;
end;

procedure TfrmAddSpec.FormCreate(Sender: TObject);
begin
 id_shablon := -1;
 id_material := -1;
end;

procedure TfrmAddSpec.SummaEditPropertiesChange(Sender: TObject);
var
 vol, sum : Extended;
begin
 if not TryStrToFloat(SummaEdit.Text, sum) then
 begin
   SummaNDSEdit.Text := '0';
   exit;
 end;
 SummaNDSEdit.Text := FormatFloat('0.0000', RoundTo(sum  + sum * SYS_NDS, -4));
 CalcCost;
end;

procedure TfrmAddSpec.CalcCost;
var
 vol, sum : Extended;
begin
 if not TryStrToFloat(SummaEdit.Text, sum) then
 begin
   PlanPriceEdit.Text := '0';
   exit;
 end;
 if not TryStrToFloat(VolumeEdit.Text, vol) then
 begin
   PlanPriceEdit.Text := '0';
   exit;
 end;
 if vol = 0 then
 begin
   PlanPriceEdit.Text := '0';
   exit;
 end;
 PlanPriceEdit.Text := FormatFloat('0.0000', RoundTo(sum / vol, -1));
end;

procedure TfrmAddSpec.VolumeEditPropertiesChange(Sender: TObject);
begin
 CalcCost;
end;

end.
