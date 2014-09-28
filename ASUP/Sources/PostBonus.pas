
{ -$Id: PostBonus.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Надбавки к должностям"                         }
{                     Отображение надбавок к должностям                        }
{                                                  ответственный: Олег Волков  }

unit PostBonus;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Buttons, ExtCtrls, Db, IBCustomDataSet, IBQuery, PersonalCommon, Grids,
    DBGrids, AddPostBonus, EditControl, StdCtrls, SpComboBox, ImgList, SpCommon;

type
    TPostBonusForm = class(TForm)
        TopPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        OkButton: TSpeedButton;
        CancelButton: TSpeedButton;
        ResultQuery: TIBQuery;
        PostBonusGrid: TDBGrid;
        PostBonusSource: TDataSource;
        ResultQueryID_POST_BONUS: TIntegerField;
        ResultQueryID_POST: TIntegerField;
        ResultQueryNAME_POST: TIBStringField;
        ResultQueryID_BONUS: TIntegerField;
        ResultQueryNAME_BONUS: TIBStringField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryIS_PERCENT: TIBStringField;
        ResultQueryPERCENT: TIntegerField;
        ResultQuerySUMMA: TIBBCDField;
        ResultQueryDesc: TStringField;
        DeleteQuery: TIBQuery;
        Panel1: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        PostBox: TSpComboBox;
        FilterButton: TBitBtn;
        FilterImages: TImageList;
        RefreshButton: TSpeedButton;
        BonusBox: TSpComboBox;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure ResultQueryCalcFields(DataSet: TDataSet);
        procedure DeleteButtonClick(Sender: TObject);
        procedure PostBonusGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FilterButtonClick(Sender: TObject);
        procedure PostBoxEnter(Sender: TObject);
        procedure PostBonusGridDblClick(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
    private
        FilterSet: Boolean;
        SpMode: TSpMode;
        procedure ShowChangeForm(Mode: TEditMode);
        procedure Refresh;
    public
        constructor Create(AOwner: TComponent; SpMode: TSpMode); reintroduce;
        procedure SetFilter;
        procedure RemoveFilter;
    end;

var
    PostBonusForm: TPostBonusForm;

implementation

{$R *.DFM}

constructor TPostBonusForm.Create(AOwner: TComponent; SpMode: TSpMode);
begin
    inherited Create(AOwner);
    Self.SpMode := SpMode;

    AddButton.Align := alLeft;
    ModifyButton.Align := alLeft;
    DeleteButton.Align := alLeft;

    CancelButton.Align := alRight;
    OkButton.Align := alRight;

    AddButton.Visible := spfAdd in SpMode;
    ModifyButton.Visible := spfModify in SpMode;
    DeleteButton.Visible := spfDelete in SpMode;
    OkButton.Visible := spfSelect in SpMode;

    if spfMultiSelect in SpMode then
        PostBonusGrid.Options := PostBonusGrid.Options + [dgMultiSelect];
end;

procedure TPostBonusForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddPostBonusForm;
    id: Integer;
begin
    if Mode <> emNew then id := ResultQuery['Id_Post_Bonus']
    else id := -1;
    form := TAddPostBonusForm.Create(Self, Mode, abmPostBonus);
    form.Id_Post_Bonus := id;
    if form.ShowModal = mrOk then
        Refresh;
    form.Free;
end;

procedure TPostBonusForm.Refresh;
begin
    QueryRefresh(ResultQuery);
    GridResize(PostBonusGrid);
end;

procedure TPostBonusForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    PostBox.SaveIntoRegistry;
    BonusBox.SaveIntoRegistry;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TPostBonusForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    DeleteQuery.Transaction := PersonalCommon.WriteTransaction;

    ResultQuery.Open;

    CancelButton.Align := alRight;
    OkButton.Align := alRight;

    BonusBox.ItemIndex := -1;
    PostBox.ItemIndex := -1;
    FilterSet := False;

    GridResize(PostBonusGrid);
end;

procedure TPostBonusForm.FormResize(Sender: TObject);
begin
    GridResize(PostBonusGrid);
end;

procedure TPostBonusForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    ShowChangeForm(emNew);
end;

procedure TPostBonusForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    if not ResultQuery.IsEmpty then
        ShowChangeForm(emModify);
end;

procedure TPostBonusForm.CancelButtonClick(Sender: TObject);
begin
    if FormStyle = fsMDIChild then Close
    else ModalResult := mrCancel;
end;

procedure TPostBonusForm.OkButtonClick(Sender: TObject);
begin
    if ResultQuery.IsEmpty then Exit;
    if spfSelect in SpMode then
        if FormStyle = fsMDIChild then Close
        else ModalResult := mrOk;
end;

procedure TPostBonusForm.ResultQueryCalcFields(DataSet: TDataSet);
begin
    if ResultQuery['Is_Percent'] = 'T' then
        ResultQuery['Desc'] := IntToStr(ResultQuery['Percent']) + '%'
    else ResultQuery['Desc'] := FloatToStr(ResultQuery['Summa']) + ' грн';
end;

procedure TPostBonusForm.DeleteButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    if MessageDlg('Чи справді ви бажаєте вилучити цей запис?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        DeleteQuery.Params.ParamValues['Id_Post_Bonus'] :=
            ResultQuery['Id_Post_Bonus'];
        ExecQuery(DeleteQuery);
        Refresh;
    end;
end;

procedure TPostBonusForm.PostBonusGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_DELETE: DeleteButton.Click;
        VK_SPACE: ModifyButton.Click;
        VK_ADD: AddButton.Click;
        VK_RETURN: OkButton.Click;
    end;
end;

procedure TPostBonusForm.FilterButtonClick(Sender: TObject);
begin
    if not FilterSet then SetFilter
    else RemoveFilter;
end;

procedure TPostBonusForm.SetFilter;
var
    ipost, ibonus: Integer;
    ifilter: string;
    img: TBitmap;
begin
    ipost := PostBox.GetId;
    ibonus := BonusBox.GetId;
    if (ipost > 0) and (ibonus > 0) then
        ifilter := 'WHERE Id_Post = ' + IntToStr(ipost) +
            ' AND Id_Bonus = ' + IntToStr(ibonus)
    else if ipost > 0 then
        ifilter := 'WHERE Id_Post = ' + IntToStr(ipost)
    else if ibonus > 0 then
        ifilter := 'WHERE Id_Bonus = ' + IntToStr(ibonus)
    else Exit;
    with ResultQuery do
    begin
        SQL.Text := SQL.Text + ifilter;
        Close;
        Open;
    end;

    FilterButton.Caption := 'Зняти фільтр';
    img := TBitmap.Create;
    FilterImages.GetBitmap(1, img);
    FilterButton.Glyph.Assign(img);
    img.Free;
    FilterSet := True;
end;

procedure TPostBonusForm.RemoveFilter;
var
    p: Integer;
    s: string;
    img: TBitmap;
begin
    with ResultQuery do
    begin
        s := SQL.Text;
        p := Pos('WHERE', s);
        System.Delete(s, p, length(s));
        SQL.Text := s;
        Close;
        Open;
    end;
    FilterButton.Caption := 'Фільтрувати';
    img := TBitmap.Create;
    FilterImages.GetBitmap(0, img);
    FilterButton.Glyph.Assign(img);
    img.Free;
    FilterSet := False;
end;

procedure TPostBonusForm.PostBoxEnter(Sender: TObject);
begin
    if FilterSet then
        if FilterButton.Enabled then FilterButton.SetFocus
        else PostBonusGrid.SetFocus;
end;

procedure TPostBonusForm.PostBonusGridDblClick(Sender: TObject);
begin
    if spfSelect in SpMode then OkButton.Click
    else ModifyButton.Click;
end;

procedure TPostBonusForm.RefreshButtonClick(Sender: TObject);
begin
    Refresh;
end;

end.
