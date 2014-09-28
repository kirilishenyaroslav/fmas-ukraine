unit PrintReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  cxDropDownEdit, cxFontNameComboBox, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, cxPropertiesStore, Registry,
  ActnList;

type
    FieldInfo = record
      fieldname: string;
      caption: string;
      alignment: TAlignment;
      order: short;
      width: single;
      aggregative_function: string;
    end;

  TPrintReport = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    cxComboBox1: TcxComboBox;
    cxFontNameComboBox1: TcxFontNameComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    cxSpinEdit3: TcxSpinEdit;
    cxSpinEdit4: TcxSpinEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Panel1: TPanel;
    cxPropertiesStore1: TcxPropertiesStore;
    ActionList1: TActionList;
    Enter: TAction;
    Esc: TAction;
    procedure Panel1Click(Sender: TObject);
    procedure OnKeyPress(Sender: TObject; var Key: Char);
    procedure ReportCreate ({ FIBDataSet: TpFIBDataSet;
                              frxReport: TfrxReport;
                           frxDBDataSet: TfrxDBDataSet;
                               strTitle: string;
                     //         TableName: string;
                                    n,m: short;
                          FieldstoOrder: array of FieldInfo;
                            OtherFields: array of FieldInfo;
                                Margins: array of short;
                             pageorient: boolean = false;
                               FontType: string = 'Arial';
                               FontSize: short = 10});
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnterExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
                                      
  private
  public
    FIBDataSet: TpFIBDataSet;
     frxReport: TfrxReport;
  frxDBDataSet: TfrxDBDataSet;
      strTitle: string;
           n,m: short;
 FieldstoOrder: array of FieldInfo;
   OtherFields: array of FieldInfo;
       Margins: array of short;
    PageOrient: boolean;
      FontType: string;
      FontSize: short;
       inquiry: string;
  end;

implementation

{$R *.dfm}

procedure TPrintReport.FormCreate(Sender: TObject);
var
Reg:TRegistry;
begin
  PageOrient:=false;
  FontType:=cxFontNameComboBox1.FontName;
  cxFontNameComboBox1.FontName:='Times New Roman';

  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
    try
      Reg.OpenKey  ('\Software\cxPropertiesStore',false);
      if Reg.ValueExists ('PageOrient')   then PageOrient:=Reg.ReadBool('PageOrient');
      if Reg.ValueExists ('PageFontName') then cxFontNameComboBox1.FontName:=Reg.ReadString('PageFontName');
      finally Reg.Free;
    End;
  if PageOrient then begin
    panel1.Caption:='Альбомна';
    panel1.Top:=181;
    panel1.Left:=51;
    panel1.Height:=70;
    panel1.Width:=96;
  end
  else begin
    panel1.Caption:='Портретна';
    panel1.Top:=168;
    panel1.Left:=64;
    panel1.Height:=96;
    panel1.Width:=70;
  end;
end;

procedure TPrintReport.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Reg:TRegistry;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
    try
      Reg.OpenKey     ('\Software\cxPropertiesStore',true);
      Reg.WriteBool   ('PageOrient',PageOrient);
      Reg.WriteString ('PageFontName',cxFontNameComboBox1.FontName);
      finally Reg.Free;
    end;
end;

procedure TPrintReport.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrcancel;
end;

procedure TPrintReport.Panel1Click(Sender: TObject);
var
t: short;
begin
  if (not PageOrient) then begin
    PageOrient:=true;
    panel1.Caption:='Альбомна';
    panel1.Top:=181;
    panel1.Left:=51;
  end
  else begin
    PageOrient:=false;
    panel1.Caption:='Портретна';
    panel1.Top:=168;
    panel1.Left:=64;
  end;
  t:=panel1.Height;
  panel1.Height:=panel1.Width;
  panel1.Width:=t;
end;

procedure TPrintReport.OnKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    begin
      key := #0;
      beep;
    end;
end;

procedure TPrintReport.cxButton1Click(Sender: TObject);
begin

  if Length(cxComboBox1.Text)>2 then begin
    FontSize:=12;
    cxComboBox1.Text:='12';
  end
  else FontSize:=strtoint(cxComboBox1.Text);
  if FontSize>72 then begin FontSize:=72; cxComboBox1.Text:='72'; end;
  if FontSize<5  then begin FontSize:=5;  cxComboBox1.Text:='5'; end;
  SetLength(Margins,4);
  if  (cxSpinEdit1.Value<1) or (cxSpinEdit1.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit1.Value:=15;
    exit;
  end;
  if  (cxSpinEdit2.Value<1) or (cxSpinEdit2.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit2.Value:=15;
    exit;
  end;
  if  (cxSpinEdit3.Value<1) or (cxSpinEdit3.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit3.Value:=15;
    exit;
  end;
  if  (cxSpinEdit4.Value<1) or (cxSpinEdit4.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit4.Value:=15;
    exit;
  end;
  Margins[0]:=cxSpinEdit2.Value;
  Margins[1]:=cxSpinEdit1.Value;
  Margins[2]:=cxSpinEdit4.Value;
  Margins[3]:=cxSpinEdit3.Value;
  FontType:=cxFontNameComboBox1.FontName;
  ReportCreate;
end;

procedure TPrintReport.ReportCreate( {FIBDataSet: TpFIBDataSet;
                                frxReport: TfrxReport;
                             frxDBDataSet: TfrxDBDataSet;
                                 strTitle: string;
                       //         TableName: string;
                                      n,m: short;
                            FieldstoOrder: array of FieldInfo;
                              OtherFields: array of FieldInfo;
                                  Margins: array of short;
                               PageOrient: boolean;
                                 FontType: string;
                                 FontSize: short});

var
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,colwidth: short;
  str,str1: string;
  pagewidth: extended;
  f: single;
  ADESC: array [0..1] of string[5];
  colswidth: array of short;
begin
  if (FontSize>72) or (FontSize<5) then begin
    ShowMessage('Будь ласка введіть правильний розмір шрифту');
    exit;
  end;
  for i:=0 to m-1 do begin
    str:=OtherFields[i].aggregative_function;
    if str<>'' then begin
      for j:=0 to length(str) do
        str[j]:=UpCase(str[j]);
      OtherFields[i].aggregative_function:=str;
      end;
    if (str<>'')and(str<>'SUM')and(str<>'MAX')and(str<>'MIN')and(str<>'AVG')and(str<>'COUNT') then begin
      ShowMessage('Field '+OtherFields[i].fieldname+' has wrong aggregative function');
      OtherFields[i].aggregative_function:='';
    end;
  end;

  SetLength(colswidth,n+m);
  adesc[0]:=' desc';
  adesc[1]:=' asc';
 { str:='select ';
  for j:=0 to n+m-1 do begin
    if j<n then str:=str+FieldstoOrder[j].fieldname+','
    else str:=str+OtherFields[j-n].fieldname+',';
  end;
  SetLength(str,Length(str)-1);
  str:=str+' from '+TableName;
 }
  str:='';
  if n>0 then begin
    str:=' order by '+FieldstoOrder[0].fieldname+adesc[FieldstoOrder[0].order];
    for j:=1 to n-1 do str:=str+','+FieldstoOrder[j].fieldname+adesc[FieldstoOrder[j].order];
  end;

  FIBDataSet.Close;
  FIBDataSet.SQLs.SelectSQL.Text:=inquiry+str;
  FIBDataSet.Open;

  frxReport.Clear;
  frxReport.DataSets.Add(frxDBDataSet);
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation:=TPrinterOrientation(PageOrient);
  Page.LeftMargin:=Margins[0];
  Page.TopMargin:=Margins[1];
  Page.RightMargin:=Margins[2];
  Page.BottomMargin:=Margins[3];

  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  for i:=0 to n+m-1 do begin
    if i<n then
    begin
      if FieldstoOrder[i].width>0.0 then begin
        f:=f+FieldstoOrder[i].width;
        k:=k+1;
      end;
    end
    else
      if OtherFields[i-n].width>0.0 then begin
        f:=f+OtherFields[i-n].width;
        k:=k+1;
      end;
  end;
  if f>1.01 then begin
    ShowMessage('wrong columns width'); exit;
  end;
  if (m+n)>k then begin
    colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
    for i:=0 to n+m-1 do begin
      if i<n then begin
        if FieldstoOrder[i].width=0 then colswidth[i]:=colwidth
        else colswidth[i]:=trunc(FieldstoOrder[i].width*pagewidth);
      end
      else begin
        if OtherFields[i-n].width=0 then colswidth[i]:=colwidth
        else colswidth[i]:=trunc(OtherFields[i-n].width*pagewidth);
      end;
    end;
  end
  else begin
    for i:=0 to n+m-1 do begin
      if i<n then colswidth[i]:=trunc(FieldstoOrder[i].width*pagewidth)
      else colswidth[i]:=trunc(OtherFields[i-n].width*pagewidth);
    end;
  end;

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);

  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=strTitle;
  Memo.Font.Size:=trunc(FontSize*1.5);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,0,pagewidth,20);

  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=10;
  PageHeader.Stretched:=true;

  l:=0;
  k:=Page.Font.Size;
  for j:=0 to n+m-1 do begin
    Memo:=TfrxMemoView.Create(PageHeader);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l,10,colswidth[j],25);
    l:=l+colswidth[j];
    if j<n then begin
      Memo.Text:=Fieldstoorder[j].caption;
      Memo.Font.Size:=k+n-j;
      end
      else begin
      Memo.Text:=OtherFields[j-n].caption;
      Memo.Font.Size:=k;
    end;
    Memo.Font.Style:=[fsBold];
    Memo.HAlign:=haCenter;
    Memo.VAlign:=TfrxVAlign(vaCenter);
    Memo.Frame.Style:=fsSolid;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSet.Name+'."'+fieldstoorder[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSet;
    Memo.DataField := fieldstoorder[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSet;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  l:=0;
  for j:=0 to m-1 do begin
    Memo := TfrxMemoView.Create(DataBand);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSet;
    Memo.DataField :=OtherFields[j].fieldname;
    Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
    l:=l+colswidth[j+n];
    if OtherFields[j].alignment=taLeftJustify then Memo.HAlign := haLeft
    else if OtherFields[j].alignment=taRightJustify then Memo.HAlign := haRight
      else Memo.HAlign := haCenter;
    Memo.Frame.Typ:=[ftLeft];
  end;

  l:=0;
  for i:=0 to n-1 do l:=l+colswidth[i];

  for j:=n-1 downto 0 do begin
    b1gf:=TfrxGroupFooter.Create(Page);
    b1gf.CreateUniqueName;
    b1gf.Stretched:=true;
    b1gf.Top:=10*(2*n-j+2);
    b1gf.Height:=0;

    if j=n-1 then begin
      k:=0;
      for i:=0 to m-1 do begin
        if length(OtherFields[i].aggregative_function)>0 then begin
          b1gf.Height:=10;
          Memo:=TfrxMemoView.Create(b1gf);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          str:='['+OtherFields[i].aggregative_function+'(';
          if OtherFields[i].aggregative_function<>'COUNT' then Memo.Text:=str+'<'+frxDBDataSet.Name+'."'+OtherFields[i].fieldname+'">,'+DataBand.Name+')]'
          else Memo.Text:=str+DataBand.Name+')]';
          Memo.Font.Style:=[fsBold];
          Memo.HAlign:=haRight;
          Memo.SetBounds(l+k,0,colswidth[n+i],10);
          Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
        end;
        k:=k+colswidth[n+i];
      end;
      k:=0;
      if b1gf.Height=10 then begin
        for i:=0 to n-2 do begin
          line:=TfrxLineView.Create(b1gf);
          line.StretchMode:=smMaxHeight;
          line.Left:=k;
          line.Top:=0;
          line.Height:=10;
          line.Width:=0;
          k:=k+colswidth[i];
        end;
        if n>=2 then begin
          line:=TfrxLineView.Create(b1gf);
          line.StretchMode:=smMaxHeight;
          line.Left:=pagewidth;
          line.Top:=0;
          line.Height:=10;
          line.Width:=0;
        end;
      end;
    end;

    l:=l-colswidth[j];
    line:=TfrxLineView.Create(b1gf);
    line.Left:=l;
    line.Top:=0;
    line.Height:=0;
    if j<>0 then line.Width:=colswidth[j]
    else line.Width:=pagewidth;

    line:=TfrxLineView.Create(DataBand);
    line.StretchMode:=smMaxHeight;
    line.Left:=l;
    line.Top:=0;
    line.Height:=10;
    line.Width:=0;
  end;

  if n=0 then begin
    RepSummary:=TfrxReportSummary.Create(Page);
    RepSummary.Height:=10;
    k:=0;
    for i:=0 to m-1 do begin
      if OtherFields[i].aggregative_function<>'' then begin
        Memo:=TfrxMemoView.Create(RepSummary);
        Memo.CreateUniqueName;
        Memo.StretchMode:=smMaxHeight;
        str:='['+OtherFields[i].aggregative_function+'(';
        if OtherFields[i].aggregative_function<>'COUNT' then Memo.Text:=str+'<'+frxDBDataSet.Name+'."'+OtherFields[i].fieldname+'">,'+DataBand.Name+')]'
        else Memo.Text:=str+DataBand.Name+')]';
        Memo.Font.Style:=[fsBold];
        Memo.SetBounds(l+k,0,colswidth[n+i],10);
        Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
      end;
      k:=k+colswidth[n+i];
    end;
  end;
  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);

  frxReport.ShowReport();
end;

procedure TPrintReport.EnterExecute(Sender: TObject);
begin
  cxButton1Click(self);
end;

procedure TPrintReport.EscExecute(Sender: TObject);
begin
  ModalResult:=mrcancel;
end;

end.
