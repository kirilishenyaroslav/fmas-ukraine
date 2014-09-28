unit BsReportFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxSpinEdit, uCommon_Messages, cxCheckBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMemo, uCommon_Funcs,
  DateUtils;

type
  TfrmReportFilter = class(TForm)
    MainPanel: TPanel;
    btnPanel: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    lblFrom: TcxLabel;
    lblTo: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
      DateBeg, DateEnd:TcxDateEdit;
      YearBox:TcxSpinEdit;
      MonthBox:TcxComboBox;
  public
     IdFunc:SmallInt; {0 - Период, 1 - на дату, 2 - Месяц, 3 - год}
     ResFilter:Variant;
     constructor Create(AOwner:TComponent; NameFunc, FormCaption:String);reintroduce;
  end;

var
  frmReportFilter: TfrmReportFilter;

implementation

{$R *.dfm}

constructor TfrmReportFilter.Create(AOwner:TComponent; NameFunc, FormCaption:String);
begin
   try
      inherited Create(AOwner);
      if NameFunc='PERIOD' then
      begin
         IdFunc:=0;
         Self.Caption:=FormCaption;
         lblFrom.Caption:='З';
         lblFrom.Width:=15;
         DateBeg:=TcxDateEdit.Create(Self);
         DateBeg.Name:='DateBeg';
         DateBeg.Parent:=Self;
         DateBeg.Top:=lblFrom.Top;
         DateBeg.Left:=lblFrom.Left+lblFrom.Width+5;
         DateBeg.Width:=90;
         DateBeg.Date:=Date;
         lblTo.Left:=DateBeg.Left+DateBeg.Width+8;
         lblTo.Caption:='По';
         lblTo.Width:=23;
         DateEnd:=TcxDateEdit.Create(Self);
         DateEnd.Name:='DateEnd';
         DateEnd.Parent:=Self;
         DateEnd.Top:=lblFrom.Top;
         DateEnd.Left:=lblTo.Left+lblTo.Width+5;
         DateEnd.Width:=90;
         DateEnd.Date:=Date;
      end
      else if NameFunc='DATE' then
           begin
               IdFunc:=1;
               Self.Caption:=FormCaption;
               lblFrom.Caption:='На дату';
               lblFrom.Width:=60;
               DateBeg:=TcxDateEdit.Create(Self);
               DateBeg.Name:='DateBeg';
               DateBeg.Parent:=Self;
               DateBeg.Top:=lblFrom.Top;
               DateBeg.Left:=lblFrom.Left+lblFrom.Width+5;
               DateBeg.Width:=90;
               lblTo.Visible:=False;
               DateBeg.Date:=Date;
           end
           else if NameFunc='MONTH' then
                begin
                    IdFunc:=2;
                    Self.Caption:=FormCaption;
                    MonthBox:=TcxComboBox.Create(Self);
                    MonthBox.Name:='MonthBox';
                    MonthBox.Parent:=Self;
                    lblFrom.Caption:='Місяць';
                    lblFrom.Width:=50;
                    MonthBox.Top:=lblFrom.Top;
                    MonthBox.Left:=lblFrom.Left+lblFrom.Width+5;
                    MonthBox.Width:=150;
                    lblTo.Visible:=False;
                    MonthBox.Properties.Items.Add('Січень');
                    MonthBox.Properties.Items.Add('Лютий');
                    MonthBox.Properties.Items.Add('Березень');
                    MonthBox.Properties.Items.Add('Квітень');
                    MonthBox.Properties.Items.Add('Травень');
                    MonthBox.Properties.Items.Add('Червень');
                    MonthBox.Properties.Items.Add('Липень');
                    MonthBox.Properties.Items.Add('Серпень');
                    MonthBox.Properties.Items.Add('Вересень');
                    MonthBox.Properties.Items.Add('Жовтень');
                    MonthBox.Properties.Items.Add('Листопад');
                    MonthBox.Properties.Items.Add('Грудень');
                    MonthBox.ItemIndex:=MonthOf(Date)-1;
                end
                else if NameFunc='YEAR' then
                     begin
                        IdFunc:=3;
                        Self.Caption:=FormCaption;
                        YearBox:=TcxSpinEdit.Create(Self);
                        YearBox.Name:='YearBox';
                        YearBox.Parent:=Self;
                        lblFrom.Caption:='Рік';
                        lblFrom.Width:=30;
                        YearBox.Top:=lblFrom.Top;
                        YearBox.Left:=lblFrom.Left+lblFrom.Width+5;
                        YearBox.Width:=100;
                        lblTo.Visible:=False;
                        YearBox.Value:=YearOf(Date);
                     end;
   except On E:Exception do
          begin
             bsShowMessage('Увага!', E.Message, mtInformation, [mbOK]);
          end;
   end;
end;

procedure TfrmReportFilter.btnOkClick(Sender: TObject);

begin
   case IdFunc of
       0: begin
             ResFilter:=VarArrayCreate([0, 1], varVariant);
             ResFilter[0]:=GetValueByNameComponent(Self, 'DateBeg');
             ResFilter[1]:=GetValueByNameComponent(Self, 'DateEnd');
          end;
       1: begin
             ResFilter:=GetValueByNameComponent(Self, 'DateBeg');
          end;
       2: begin
             ResFilter:=GetValueByNameComponent(Self, 'MonthBox')+1;
          end;
       3: begin
             ResFilter:=GetValueByNameComponent(Self, 'YearBox');
          end;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmReportFilter.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

initialization RegisterClass(TfrmReportFilter);

end.
