unit CMLauncherIFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, Vcl.StdCtrls, cxTextEdit, Vcl.ExtCtrls, cxContainer,
  cxEdit, Vcl.Mask, System.ImageList, Vcl.ImgList, cxImageList, RzButton,
  RzEdit, RzBtnEdt, ElXPThemedControl, ElEdits, ElBtnEdit, RzPanel, RzPathBar,

  System.Generics.Collections, cxImageComboBox, Vcl.Menus, cxClasses, RzCommon,
  dxLayoutContainer, dxLayoutControl, dxGDIPlusClasses, RzBckgnd;

type
  TNodeType = (ntMain, ntSub);

  TForm1 = class(TForm)
    cxTreeList1: TcxTreeList;
    SaveTreeButton: TButton;
    NameARcxTreeList1Column: TcxTreeListColumn;
    Panel1: TPanel;
    RzToolButtonPrevious: TRzToolButton;
    Btns24ImageList: TcxImageList;
    RzToolButtonForward: TRzToolButton;
    SidePanel: TPanel;
    ButtonsPanel: TPanel;
    DeptRzToolButton: TRzToolButton;
    HomeRzToolButton: TRzToolButton;
    ElButtonEditPath: TElButtonEdit;
    ElButtonEditSearch: TElButtonEdit;
    RzPathBar1: TRzPathBar;
    TreeBtns24ImageList: TcxImageList;
    LoadTreeButton: TButton;
    PanelPath: TPanel;
    Menu32ImageList: TcxImageList;
    ImagecxTreeList1Column: TcxTreeListColumn;
    Menu16ImageList: TcxImageList;
    RzToolButtonHistory: TRzToolButton;
    HistoryPopupMenu: TPopupMenu;
    Menu24ImageList: TcxImageList;
    NameENcxTreeList1Column: TcxTreeListColumn;
    IsFavcxTreeList1Column: TcxTreeListColumn;
    NavBarIndexcxTreeList1Column: TcxTreeListColumn;
    ModuleIdcxTreeList1Column: TcxTreeListColumn;
    IsReportcxTreeList1Column: TcxTreeListColumn;
    SC24cxImageList: TcxImageList;
    Panel3: TPanel;
    LinkLabel1: TLinkLabel;
    Image1: TImage;
    RzSeparator1: TRzSeparator;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure SaveTreeButtonClick(Sender: TObject);
    procedure cxTreeList1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxTreeList1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxTreeList1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SidePanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SidePanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SidePanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ElButtonEditPathEnter(Sender: TObject);
    procedure ElButtonEditPathExit(Sender: TObject);
    procedure cxTreeList1CustomDrawIndentCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListIndentCellViewInfo;
      var ADone: Boolean);
    procedure cxTreeList1MouseLeave(Sender: TObject);
    procedure LoadTreeButtonClick(Sender: TObject);
    procedure cxTreeList1FocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure cxTreeList1CustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure RzToolButtonForwardClick(Sender: TObject);
    procedure RzToolButtonPreviousClick(Sender: TObject);
    procedure ElButtonEditPathKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzToolButtonHistoryClick(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure LinkLabel1Click(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    VbIsResizing, VbNavigate: boolean;
    VoOldPos : TPoint;
    VoBtn: TButton;
    VoHistoryList: TList<Integer>;
    ViListIndex: Integer;

    procedure FillTree;
    procedure FillTreeImageComboBox;
    procedure AdjustNavBtns;

    procedure DoClickPathBarItem(Sender: TObject);
    procedure MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
    procedure AdvancedDrawMenuItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
    procedure DoItemClick(Sender: TObject);
    procedure DoLabelClick(Sender: TObject);
    procedure DoDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
    procedure DoLinkLabel1LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);

    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.SaveTreeButtonClick(Sender: TObject);
begin
  cxTreeList1.SaveToFile('treeitems.txt');
end;

procedure TForm1.ScrollBox1Click(Sender: TObject);
begin
  ScrollBox1.SetFocus;
end;

procedure TForm1.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  LTopLeft, LTopRight, LBottomLeft, LBottomRight: SmallInt;
  LPoint: TPoint;
  ScrollBox: TScrollBox;
begin
  ScrollBox := TScrollBox(Sender);
  LPoint := ScrollBox.ClientToScreen(Point(0,0));
  LTopLeft := LPoint.X;
  LTopRight := LTopLeft + ScrollBox.ClientWidth;
  LBottomLeft := LPoint.Y;
  LBottomRight := LBottomLeft + ScrollBox.ClientWidth;
  if (MousePos.X >= LTopLeft) and
    (MousePos.X <= LTopRight) and
    (MousePos.Y >= LBottomLeft) and
    (MousePos.Y <= LBottomRight) then
  begin
    ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position - WheelDelta;
    Handled := True;
  end;
end;

procedure TForm1.AdjustNavBtns;
begin
  RzToolButtonForward.Enabled := (ViListIndex < VoHistoryList.Count-1);
  RzToolButtonPrevious.Enabled := (ViListIndex > 0);
end;

procedure TForm1.cxTreeList1CustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  LiImageIndex, LiModuleId: Integer;
  LoModuleNode: TcxTreelistNode;
  LsCaption: string;
begin
  // Deparments
  if (AViewInfo.Node.Level = 0) then
  begin
    if AViewInfo.Node.Focused then
      ACanvas.Font.Color := clBlack
    else
      ACanvas.Font.Color := clMenuHighLight;
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Size := 11;
  end
  // Modules
  else if (AViewInfo.Node.Level = 1) then
  begin
    if AViewInfo.Node.Focused then
      ACanvas.Font.Color := clBlack
    else
      ACanvas.Font.Color := clMenuHighLight;
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Size := 9;
  end
  // Forms
  else
  begin
    ACanvas.Font.Color := clBlack;
    ACanvas.Font.Size := 9;
  end;//if

  with AViewInfo do
   with Node, ACanvas do
   begin
      // draw Image
      Pen.Color := Brush.Color;

      Canvas.Rectangle(BoundsRect.Left, BoundsRect.Top, BoundsRect.Right, BoundsRect.Bottom+1);

      if VarIsNull(Node.Values[ImagecxTreeList1Column.ItemIndex]) then
         LiImageIndex := 0
      else
         LiImageIndex := Node.Values[ImagecxTreeList1Column.ItemIndex];

     //  draw text
      LsCaption := Node.Values[NameARcxTreeList1Column.ItemIndex];
      if BiDiMode = bdLeftToRight then
        TextOut((50+(Node.Level*15)), BoundsRect.Top + ((BoundsRect.Bottom - BoundsRect.Top) - TextHeight(LsCaption)) div 2, LsCaption)
      else
        TextOut(BoundsRect.Right - TextWidth(LsCaption) - 5, BoundsRect.Top + ((BoundsRect.Bottom - BoundsRect.Top) - TextHeight(LsCaption)) div 2, LsCaption);

      with BoundsRect do
      begin
        if Node.Level = 0 then
          Menu24ImageList.Draw(Canvas, Left{(Left + (Right-Left) div 2) - 8}, (Top + (Bottom - Top) div 2) - 12, 14, dsTransparent, itImage)
        else if Node.Level = 1 then
          Menu24ImageList.Draw(Canvas, Left{(Left + (Right-Left) div 2) - 8}, (Top + (Bottom - Top) div 2) - 12, LiImageIndex, dsTransparent, itImage)
        else if Node.Level > 1 then
        begin
          LoModuleNode := Node.Parent;
          while LoModuleNode.Level > 1  do
            LoModuleNode := LoModuleNode.Parent;

          if VarIsNull(LoModuleNode.Values[ModuleIdcxTreeList1Column.ItemIndex]) then
             LiModuleId := 0
          else
             LiModuleId := LoModuleNode.Values[ModuleIdcxTreeList1Column.ItemIndex];

          if LiModuleId = 8 then
          begin
            SC24cxImageList.Draw(Canvas, Left{(Left + (Right-Left) div 2) - 8}, (Top + (Bottom - Top) div 2) - 12, LiImageIndex, dsTransparent, itImage);
          end;
        end;//if.
      end;//if.
      ADone := True;
   end;//with.
end;

procedure TForm1.cxTreeList1CustomDrawIndentCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListIndentCellViewInfo;
  var ADone: Boolean);
var
  LiWidth: integer;
begin
  with AViewInfo do
    with Node, ACanvas do
        if HasChildren then
        begin
          //Pen.Color := Brush.Color;

          Canvas.Rectangle(BoundsRect.Left, BoundsRect.Top, BoundsRect.Right, BoundsRect.Bottom+1);


          with BoundsRect do
          begin
//            if Expanded then
//              TreeBtns24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, 0, dsTransparent, itImage)
//            else
//              TreeBtns24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, 1, dsTransparent, itImage);
          end;

          ADone := True;
        end;//if.
end;

procedure TForm1.cxTreeList1FocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var
  LsSelectedPath: string;
  LoCurrentNode: TcxTreeListNode;
  LArrNodes: array of TcxTreeListNode;
  LiI, LiJ, LiGroupIndex: Integer;
  LoMenuItem: TMenuItem;

  LoLbl: TLabel;
  LoRzSeparator: TRzSeparator;

  LiCol1_Y, LiCol2_Y, LiCol3_Y: Integer;
  LiCol1_X, LiCol2_X, LiCol3_X: Integer;

  // Layout Groups
  VoBaseVerticalGroup_L1, VoHorizontalGroup_L2,
  VoParentNodeVerticalGroup_L3, VoMainItemHorizontalGroup_L4: TdxLayoutGroup;


  procedure FillHistoryMenuItems;
  var
    LiJ: Integer;
  begin
    HistoryPopupMenu.Items.Clear;

    for LiJ := 0 to VoHistoryList.Count-1 do
    begin
      LoMenuItem := TMenuItem.Create(nil);
      with LoMenuItem do
      begin
        Caption := cxTreeList1.AbsoluteItems[VoHistoryList[LiJ]].Values[NameARcxTreeList1Column.ItemIndex];
        Tag := VoHistoryList[LiJ];
        if VarIsNull(cxTreeList1.AbsoluteItems[VoHistoryList[LiJ]].Values[ImagecxTreeList1Column.ItemIndex]) then
          ImageIndex := -1
        else
          ImageIndex := cxTreeList1.AbsoluteItems[VoHistoryList[LiJ]].Values[ImagecxTreeList1Column.ItemIndex];
        LoMenuItem.Name := Format('N%S',[VoHistoryList[LiJ].ToString]);
        LoMenuItem.OnClick := DoItemClick;
        //LoMenuItem.OnAdvancedDrawItem := AdvancedDrawMenuItem;
        HistoryPopupMenu.Items.Add(LoMenuItem);
      end; // with
    end; // for
  end;


//
//  procedure AddBaseVerticalGroup_L1(AoLayoutGroup_Root: TdxLayoutGroup);
//  begin
//    VoBaseVerticalGroup_L1 := TdxLayoutGroup.Create(dxLayoutControl1Group_Root);
//    VoBaseVerticalGroup_L1.Parent := dxLayoutControl1Group_Root;
//    VoBaseVerticalGroup_L1.CaptionOptions.Text := '';
//    VoBaseVerticalGroup_L1.LayoutDirection := ldVertical;
//    VoBaseVerticalGroup_L1.SizeOptions.Width := dxLayoutControl1.Width;
//    //VoBaseVerticalGroup_L1.SizeOptions.Height := 30;
//    VoBaseVerticalGroup_L1.SizeOptions.SizableVert := true;
//    VoBaseVerticalGroup_L1.SizeOptions.SizableHorz := true;
//    VoBaseVerticalGroup_L1.ShowBorder := false;
//    VoBaseVerticalGroup_L1.Index := LiGroupIndex;
//  end;
//
//  function AddHorizontalGroup_L2(AoBaseVerticalGroup_L1: TdxLayoutGroup; AoNode: TcxTreeListNode): TdxLayoutGroup;
//  var
//    LoHorizontalGroup_L2: TdxLayoutGroup;
//  begin
//    LoHorizontalGroup_L2 := TdxLayoutGroup.Create(AoBaseVerticalGroup_L1);
//    LoHorizontalGroup_L2.Parent := AoBaseVerticalGroup_L1;
//    LoHorizontalGroup_L2.CaptionOptions.Text := '';
//    LoHorizontalGroup_L2.LayoutDirection := ldHorizontal;
//    LoHorizontalGroup_L2.SizeOptions.Width := dxLayoutControl1.Width;
//    //LoHorizontalGroup_L2.SizeOptions.Height := 30;
//    LoHorizontalGroup_L2.SizeOptions.SizableVert := true;
//    LoHorizontalGroup_L2.SizeOptions.SizableHorz := true;
//    LoHorizontalGroup_L2.ShowBorder := false;
//    //LoHorizontalGroup_L2.Index := LiGroupIndex;
//
//    Result := LoHorizontalGroup_L2;
//  end;
//
//  function AddParentNodeVerticalGroup_L3(AoHorizontalGroup_L2: TdxLayoutGroup; AoNode: TcxTreeListNode): TdxLayoutGroup;
//  var
//    LoParentNodeVerticalGroup_L3: TdxLayoutGroup;
//  begin
//    LoParentNodeVerticalGroup_L3 := TdxLayoutGroup.Create(AoHorizontalGroup_L2);
//    LoParentNodeVerticalGroup_L3.Parent := AoHorizontalGroup_L2;
//    LoParentNodeVerticalGroup_L3.CaptionOptions.Text := '';
//    LoParentNodeVerticalGroup_L3.LayoutDirection := ldVertical;
//    LoParentNodeVerticalGroup_L3.SizeOptions.Width := Trunc(dxLayoutControl1.Width/3);
//    //LoParentNodeVerticalGroup_L3.SizeOptions.Height := 30;
//    LoParentNodeVerticalGroup_L3.SizeOptions.SizableVert := true;
//    LoParentNodeVerticalGroup_L3.SizeOptions.SizableHorz := true;
//    LoParentNodeVerticalGroup_L3.ShowBorder := false;
//    //LoParentNodeVerticalGroup_L3.Index := LiGroupIndex;
//    //LoParentNodeVerticalGroup_L3.Tag := AoNode.AbsoluteIndex;
//
//    Result := LoParentNodeVerticalGroup_L3;
//  end;
//  // Main Item
//  procedure AddMainItemHorizontalGroup_L4(AoParentNodeVerticalGroup_L3: TdxLayoutGroup; AoNode: TcxTreeListNode);
//  var
//    LoMainItemHorizontalGroup_L4: TdxLayoutGroup;
//    LoImageRzToolButton: TRzToolButton;
//    LoLink: TLinkLabel;
//    LoImageLayoutItem, LoLinkLayoutItem: TdxLayoutItem;
//  begin
//    LoMainItemHorizontalGroup_L4 := TdxLayoutGroup.Create(AoParentNodeVerticalGroup_L3);
//    LoMainItemHorizontalGroup_L4.Parent := AoParentNodeVerticalGroup_L3;
//    LoMainItemHorizontalGroup_L4.CaptionOptions.Text := '';
//    LoMainItemHorizontalGroup_L4.LayoutDirection := ldHorizontal;
//    LoMainItemHorizontalGroup_L4.SizeOptions.Width := Trunc(dxLayoutControl1.Width/3);
//    LoMainItemHorizontalGroup_L4.SizeOptions.Height := 30;
//    LoMainItemHorizontalGroup_L4.SizeOptions.SizableVert := true;
//    LoMainItemHorizontalGroup_L4.SizeOptions.SizableHorz := true;
//    LoMainItemHorizontalGroup_L4.ShowBorder := false;
//    //LoMainItemHorizontalGroup_L4.Index := LiGroupIndex;
//    LoMainItemHorizontalGroup_L4.Tag := AoNode.AbsoluteIndex;
//
//    LoImageRzToolButton := TRzToolButton.Create(LoMainItemHorizontalGroup_L4);
//    LoImageRzToolButton.Parent := Self;
//    LoImageRzToolButton.Name := 'ImageRzToolButton'+IntToStr(AoNode.AbsoluteIndex);
//    LoImageRzToolButton.Tag := AoNode.AbsoluteIndex;
//    LoImageRzToolButton.Width := 24;
//    LoImageRzToolButton.Height := 28;
//    if VarIsNull(AoNode.Values[ImagecxTreeList1Column.ItemIndex]) then
//       LoImageRzToolButton.ImageIndex := -1
//    else
//       LoImageRzToolButton.ImageIndex := AoNode.Values[ImagecxTreeList1Column.ItemIndex];
//    LoImageRzToolButton.Images := Menu24ImageList;
//    LoImageRzToolButton.UseToolbarButtonSize := False;
//    LoImageRzToolButton.UseToolbarVisualStyle := False;
//    LoImageRzToolButton.VisualStyle := TRzVisualStyle.vsWinXP;
//    LoImageRzToolButton.Color := clNone;
//    //LoImageRzToolButton.OnClick := DoLinkLabel1LinkClick;
//
//    LoImageLayoutItem := LoMainItemHorizontalGroup_L4.CreateItemForControl(LoImageRzToolButton);
//    LoImageLayoutItem.Move(LoMainItemHorizontalGroup_L4, LoMainItemHorizontalGroup_L4.Count-1);
//
//    LoLink := TLinkLabel.Create(LoMainItemHorizontalGroup_L4);
//    LoLink.Parent := Self;
//    LoLink.Font.Size := 12;
//    LoLink.Font.Color := clHighlight;
//    LoLink.Name := 'LinkLabel'+IntToStr(AoNode.AbsoluteIndex);
//    LoLink.Caption := AoNode.Values[NameARcxTreeList1Column.ItemIndex];
//    LoLink.Tag := AoNode.AbsoluteIndex;
//    LoLink.OnLinkClick := DoLinkLabel1LinkClick;
//
//    LoLinkLayoutItem := LoMainItemHorizontalGroup_L4.CreateItemForControl(LoLink);
//    LoLinkLayoutItem.Move(LoMainItemHorizontalGroup_L4, LoMainItemHorizontalGroup_L4.Count-1);
//  end;
//
//  // Sub Item
//  procedure AddSubItemHorizontalGroup_L4(AoParentNodeVerticalGroup_L3: TdxLayoutGroup; AoNode: TcxTreeListNode);
//  var
//    LoSubItemHorizontalGroup_L4: TdxLayoutGroup;
//    LoImageRzToolButton: TRzToolButton;
//    LoLink: TLinkLabel;
//    LoImageLayoutItem, LoLinkLayoutItem: TdxLayoutItem;
//    LoEmptySpaceLayout: TdxLayoutEmptySpaceItem;
//  begin
//    LoSubItemHorizontalGroup_L4 := TdxLayoutGroup.Create(AoParentNodeVerticalGroup_L3);
//    LoSubItemHorizontalGroup_L4.Parent := AoParentNodeVerticalGroup_L3;
//    LoSubItemHorizontalGroup_L4.CaptionOptions.Text := '';
//    LoSubItemHorizontalGroup_L4.LayoutDirection := ldHorizontal;
//    LoSubItemHorizontalGroup_L4.SizeOptions.Width := Trunc(dxLayoutControl1.Width/3);
//    LoSubItemHorizontalGroup_L4.SizeOptions.Height := 30;
//    LoSubItemHorizontalGroup_L4.SizeOptions.SizableVert := true;
//    LoSubItemHorizontalGroup_L4.SizeOptions.SizableHorz := true;
//    LoSubItemHorizontalGroup_L4.ShowBorder := false;
//    //LoSubItemHorizontalGroup_L4.OnCaptionClick := DoClickLinkLabel;
//    //LoSubItemHorizontalGroup_L4.Index := LiGroupIndex;
//    LoSubItemHorizontalGroup_L4.Tag := AoNode.AbsoluteIndex;
//
//    LoEmptySpaceLayout := TdxLayoutEmptySpaceItem.Create(LoSubItemHorizontalGroup_L4);
//    LoEmptySpaceLayout.Parent := LoSubItemHorizontalGroup_L4;
//    LoEmptySpaceLayout.SizeOptions.Width := 30;
//
//    LoImageRzToolButton := TRzToolButton.Create(LoSubItemHorizontalGroup_L4);
//    LoImageRzToolButton.Parent := Self;
//    LoImageRzToolButton.Name := 'ImageRzToolButton'+IntToStr(AoNode.AbsoluteIndex);
//    LoImageRzToolButton.Tag := AoNode.AbsoluteIndex;
//    LoImageRzToolButton.Width := 24;
//    LoImageRzToolButton.Height := 28;
//    if VarIsNull(AoNode.Values[ImagecxTreeList1Column.ItemIndex]) then
//       LoImageRzToolButton.ImageIndex := -1
//    else
//       LoImageRzToolButton.ImageIndex := AoNode.Values[ImagecxTreeList1Column.ItemIndex];
//    LoImageRzToolButton.Images := Menu24ImageList;
//    LoImageRzToolButton.UseToolbarButtonSize := False;
//    LoImageRzToolButton.UseToolbarVisualStyle := False;
//    LoImageRzToolButton.VisualStyle := TRzVisualStyle.vsWinXP;
//    LoImageRzToolButton.Color := clNone;
//    //LoImageRzToolButton.OnClick := DoClickLinkLabel;
//
//    LoImageLayoutItem := LoSubItemHorizontalGroup_L4.CreateItemForControl(LoImageRzToolButton);
//    LoImageLayoutItem.Move(LoSubItemHorizontalGroup_L4, LoSubItemHorizontalGroup_L4.Count-1);
//
//    LoLink := TLinkLabel.Create(LoSubItemHorizontalGroup_L4);
//    LoLink.Parent := Self;
//    LoLink.Name := 'LinkLabel'+IntToStr(AoNode.AbsoluteIndex);
//    LoLink.Caption := AoNode.Values[NameARcxTreeList1Column.ItemIndex];
//    LoLink.Tag := AoNode.AbsoluteIndex;
//    LoLink.UseVisualStyle := True;
//    LoLink.OnLinkClick := DoLinkLabel1LinkClick;
//
//    LoLinkLayoutItem := LoSubItemHorizontalGroup_L4.CreateItemForControl(LoLink);
//    LoLinkLayoutItem.Move(LoSubItemHorizontalGroup_L4, LoSubItemHorizontalGroup_L4.Count-1);
//  end;
//
//  procedure AddHorizontalSepratorGroup_L4(AoParentNodeVerticalGroup_L3: TdxLayoutGroup);
//  var
//    LoHorizontalSepratorGroup_L4: TdxLayoutGroup;
//    LoPanel: TPanel;
//    LoPanelLayoutItem: TdxLayoutItem;
//  begin
//    LoHorizontalSepratorGroup_L4 := TdxLayoutGroup.Create(AoParentNodeVerticalGroup_L3);
//    LoHorizontalSepratorGroup_L4.Parent := AoParentNodeVerticalGroup_L3;
//    LoHorizontalSepratorGroup_L4.CaptionOptions.Text := '';
//    LoHorizontalSepratorGroup_L4.LayoutDirection := ldHorizontal;
//    LoHorizontalSepratorGroup_L4.SizeOptions.Width := Trunc(dxLayoutControl1.Width/3);
//    LoHorizontalSepratorGroup_L4.SizeOptions.Height := 3;
//    LoHorizontalSepratorGroup_L4.CaptionOptions.Text := '';
//    LoHorizontalSepratorGroup_L4.ShowBorder := false;
//    //LoHorizontalSepratorGroup_L4.Index := LiGroupIndex;
//
//    LoPanel := TPanel.Create(LoHorizontalSepratorGroup_L4);
//    LoPanel.Parent := Self;
//    LoPanel.Height := 2;
//    LoPanel.Width := Trunc(dxLayoutControl1.Width/3)-10;
//    LoPanel.BevelOuter := bvSpace;
//    LoPanel.BevelInner := bvSpace;
//
//    LoPanelLayoutItem := LoHorizontalSepratorGroup_L4.CreateItemForControl(LoPanel);
//    LoPanelLayoutItem.Move(LoHorizontalSepratorGroup_L4, LoHorizontalSepratorGroup_L4.Count-1);
//  end;
//

begin
  LsSelectedPath := EmptyStr;
  LiI := 0;
  LiGroupIndex := 0;
  RzPathBar1.Items.Clear;
  SetLength(LArrNodes,1);

  try
    LoCurrentNode := AFocusedNode;

    if not VbNavigate then
    begin
      VoHistoryList.Add(LoCurrentNode.AbsoluteIndex);
      if VoHistoryList.Count > 10 then
        VoHistoryList.Remove(VoHistoryList[0])
      else
        Inc(ViListIndex);

      FillHistoryMenuItems;
    end;
    AdjustNavBtns;
    Repeat
    begin
      LArrNodes[LiI] := LoCurrentNode;
      LoCurrentNode := LoCurrentNode.Parent;
      if LoCurrentNode.Parent <> nil then
      begin
        Inc(LiI);
        SetLength(LArrNodes,Length(LArrNodes)+1);
      end; // if
    end // repeat
    Until LoCurrentNode.Parent = nil;


    // Create pathbar items and PathStr
    for LiI := Length(LArrNodes)-1 Downto 0 do
    begin
      if (LiI = (Length(LArrNodes)-1)) then
        LsSelectedPath := LArrNodes[LiI].Values[NameARcxTreeList1Column.ItemIndex]
      else
        LsSelectedPath := LsSelectedPath+'\'+LArrNodes[LiI].Values[NameARcxTreeList1Column.ItemIndex];

      with RzPathBar1.Items.Add do
      begin
        Caption := LArrNodes[LiI].Values[NameARcxTreeList1Column.ItemIndex];
        Tag := LArrNodes[LiI].AbsoluteIndex;
        LinkInfo := LsSelectedPath;
        if VarIsNull(LArrNodes[LiI].Values[ImagecxTreeList1Column.ItemIndex]) then
          ImageIndex := -1
        else
          ImageIndex := LArrNodes[LiI].Values[ImagecxTreeList1Column.ItemIndex];
        OnClick := DoClickPathBarItem;
      end; // with
    end; // for
  finally
    SetLength(LArrNodes,0);
    Finalize(LArrNodes);
  end;//try..finally

  {// Create Link Labels
  dxLayoutControl1Group_Root.DestroyComponents;
  // 1
  AddBaseVerticalGroup_L1(dxLayoutControl1Group_Root);
  Inc(LiGroupIndex);
  // 2
  LoCurrentNode := AFocusedNode;
  if LoCurrentNode.HasChildren then
  begin
    for LiI := 0 to LoCurrentNode.Count-1 do
    begin
      if (LiI = 0) or (LiI mod 3 = 0) then
      begin
        VoHorizontalGroup_L2 := AddHorizontalGroup_L2(VoBaseVerticalGroup_L1, LoCurrentNode.Items[LiI]);
        Inc(LiGroupIndex);
      end;
      // 3
      VoParentNodeVerticalGroup_L3 := AddParentNodeVerticalGroup_L3(VoHorizontalGroup_L2,LoCurrentNode.Items[LiI]);
      Inc(LiGroupIndex);

      AddMainItemHorizontalGroup_L4(VoParentNodeVerticalGroup_L3, LoCurrentNode.Items[LiI]);
      Inc(LiGroupIndex);
      if LoCurrentNode.Items[LiI].HasChildren then
        for LiJ := 0 to LoCurrentNode.Items[LiI].Count-1  do
        begin
          AddSubItemHorizontalGroup_L4(VoParentNodeVerticalGroup_L3, LoCurrentNode.Items[LiI].Items[LiJ]);
          Inc(LiGroupIndex);
        end;
      AddHorizontalSepratorGroup_L4(VoParentNodeVerticalGroup_L3);
      Inc(LiGroupIndex);
    end;// for
  end
  else
  begin
    AddSubItemHorizontalGroup_L4(VoBaseVerticalGroup_L1, LoCurrentNode);
  end;}//if

  LiCol1_Y := 0;
  LiCol2_Y := 0;
  LiCol3_Y := 0;

  LiCol1_X := 0;
  LiCol2_X := Trunc(ScrollBox1.Width/3);
  LiCol3_X := Trunc((ScrollBox1.Width/3)*2);

  while Scrollbox1.ControlCount > 0 do
  begin
    Scrollbox1.controls[0].Free;
  end;


  LoCurrentNode := AFocusedNode;
  if LoCurrentNode.HasChildren then
  begin
    for LiI := 0 to LoCurrentNode.Count - 1 do
    begin
      // Main
      case (LiI + 1) mod 3 of
        1:
          begin
            LoLbl := TLabel.Create(ScrollBox1);
            LoLbl.Left := LiCol1_X + 10;
            with LoLbl do
            begin
              Caption := LoCurrentNode.Items[LiI].Values[NameARcxTreeList1Column.ItemIndex];
              SetBounds(LiCol1_X + 10, LiCol1_Y, Width, Height);
              Parent := ScrollBox1;
              Tag := LoCurrentNode.Items[LiI].AbsoluteIndex;
              Font.Style := [fsBold];
              Font.Color := clHighlight;
              OnMouseEnter := LabelMouseEnter;
              OnMouseLeave := LabelMouseLeave;
              OnClick := DoLabelClick;
            end;
            Inc(LiCol1_Y, 20);
          end;
        2:
          begin
            LoLbl := TLabel.Create(ScrollBox1);
            LoLbl.Left := LiCol2_X;
            with LoLbl do
            begin
              Caption := LoCurrentNode.Items[LiI].Values[NameARcxTreeList1Column.ItemIndex];
              SetBounds(LiCol2_X + 10, LiCol2_Y, Width, Height);
              Parent := ScrollBox1;
              Tag := LoCurrentNode.Items[LiI].AbsoluteIndex;
              Font.Style := [fsBold];
              Font.Color := clHighlight;
              OnMouseEnter := LabelMouseEnter;
              OnMouseLeave := LabelMouseLeave;
              OnClick := DoLabelClick;
            end;
            Inc(LiCol2_Y, 20);
          end;
        0:
          begin
            LoLbl := TLabel.Create(ScrollBox1);
            LoLbl.Left := LiCol3_X;
            with LoLbl do
            begin
              Caption := LoCurrentNode.Items[LiI].Values[NameARcxTreeList1Column.ItemIndex];
              SetBounds(LiCol3_X + 10, LiCol3_Y, Width, Height);
              Parent := ScrollBox1;
              Tag := LoCurrentNode.Items[LiI].AbsoluteIndex;
              Font.Style := [fsBold];
              Font.Color := clHighlight;
              OnMouseEnter := LabelMouseEnter;
              OnMouseLeave := LabelMouseLeave;
              OnClick := DoLabelClick;
            end;
            Inc(LiCol3_Y, 20);
          end;
      end; // case.

    // Sub
    if LoCurrentNode.Items[LiI].HasChildren then
      for LiJ := 0 to LoCurrentNode.Items[LiI].Count - 1 do
      begin
        case (LiI + 1) mod 3 of
          1:
            begin
              LoLbl := TLabel.Create(ScrollBox1);
              LoLbl.Left := LiCol1_X+ 30;
              with LoLbl do
              begin
                Caption := LoCurrentNode.Items[LiI].Items[LiJ].Values[NameARcxTreeList1Column.ItemIndex];
                SetBounds(LiCol1_X+ 30, LiCol1_Y, Width, Height);
                Parent := ScrollBox1;
                Tag := LoCurrentNode.Items[LiI].Items[LiJ].AbsoluteIndex;
                OnMouseEnter := LabelMouseEnter;
                OnMouseLeave := LabelMouseLeave;
                OnClick := DoLabelClick;
              end;
              Inc(LiCol1_Y, 20);
            end;
          2:
            begin
              LoLbl := TLabel.Create(ScrollBox1);
              LoLbl.Left := LiCol2_X;
              with LoLbl do
              begin
                Caption := LoCurrentNode.Items[LiI].Items[LiJ].Values[NameARcxTreeList1Column.ItemIndex];
                SetBounds(LiCol2_X+ 30, LiCol2_Y, Width, Height);
                Parent := ScrollBox1;
                Tag := LoCurrentNode.Items[LiI].Items[LiJ].AbsoluteIndex;
                OnMouseEnter := LabelMouseEnter;
                OnMouseLeave := LabelMouseLeave;
                OnClick := DoLabelClick;
              end;
              Inc(LiCol2_Y, 20);
            end;
          0:
            begin
              LoLbl := TLabel.Create(ScrollBox1);
              LoLbl.Left := LiCol3_X;
              with LoLbl do
              begin
                Caption := LoCurrentNode.Items[LiI].Items[LiJ].Values[NameARcxTreeList1Column.ItemIndex];
                SetBounds(LiCol3_X+ 30, LiCol3_Y, Width, Height);
                Parent := ScrollBox1;
                OnMouseEnter := LabelMouseEnter;
                OnMouseLeave := LabelMouseLeave;
                OnClick := DoLabelClick;
                Tag := LoCurrentNode.Items[LiI].Items[LiJ].AbsoluteIndex;
              end;
              Inc(LiCol3_Y, 20);
            end;
        end; // case.
      end; // for.
      // speparator

      LoRzSeparator := TRzSeparator.Create(ScrollBox1);
      case (LiI + 1) mod 3 of
        1:
          begin
            Inc(LiCol1_Y, 10);
            LoRzSeparator.Left := LiCol1_X + 10;
            LoRzSeparator.SetBounds(LiCol1_X + 10, LiCol1_Y, 200, 1);
            Inc(LiCol1_Y, 20);
          end;
        2:
          begin
            Inc(LiCol2_Y, 10);
            LoRzSeparator.Left := LiCol2_X + 10;
            LoRzSeparator.SetBounds(LiCol2_X + 10, LiCol2_Y, 200, 1);
            Inc(LiCol2_Y, 20);
          end;
        0:
          begin
            Inc(LiCol3_Y, 10);
            LoRzSeparator.Left := LiCol3_X + 10;
            LoRzSeparator.SetBounds(LiCol3_X + 10, LiCol3_Y, 200, 1);
            Inc(LiCol3_Y, 20);
          end; // case.
      end;
      LoRzSeparator.ShowGradient := false;
      LoRzSeparator.Height := 1;
      LoRzSeparator.Parent := ScrollBox1;
      LoRzSeparator.HighlightColor := clGrayText;
    end; // for.
  end // for.
  else
  begin
    // Node
    LoLbl := TLabel.Create(ScrollBox1);
    LoLbl.Left := LiCol1_X+10;
    with LoLbl do
    begin
      Caption := LoCurrentNode.Values[NameARcxTreeList1Column.ItemIndex];
      SetBounds(LiCol1_X+10, LiCol1_Y, Width, Height);
      Parent := ScrollBox1;
      Tag := LoCurrentNode.AbsoluteIndex;
      Font.Style := [fsBold];
      Font.Color := clHighlight;
      OnMouseEnter := LabelMouseEnter;
      OnMouseLeave := LabelMouseLeave;
      OnClick := DoLabelClick;
      Inc(LiCol1_Y, 30);
    end;
    // Separator
    Inc(LiCol1_Y, 10);
    LoRzSeparator := TRzSeparator.Create(ScrollBox1);
    LoRzSeparator.Left := LiCol1_X + 10;
    LoRzSeparator.Parent := ScrollBox1;
    LoRzSeparator.SetBounds(LiCol1_X + 10, LiCol1_Y, 200, 1);
    Inc(LiCol1_Y, 20);
    LoRzSeparator.ShowGradient := false;
    LoRzSeparator.Height := 1;
    LoRzSeparator.HighlightColor := clGrayText;
  end; // if.

  LoCurrentNode.Expand(false);
  ElButtonEditPath.Text := LsSelectedPath;
  PanelPath.Width := (Length(LsSelectedPath)+Trunc(1/Length(LsSelectedPath)*Length(LsSelectedPath))) * 11{ElButtonEditPath.Font.Size};
end;

procedure TForm1.cxTreeList1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TWinControl) then
  begin
    VbIsResizing := True;
    SetCapture(TWinControl(Sender).Parent.Handle);
    GetCursorPos(VoOldPos);
  end;
end;

procedure TForm1.cxTreeList1MouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TForm1.cxTreeList1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  CminWidth = 200;
  CmaxWidth = 400;
var
  LoNewPos: TPoint;
  LoFrmPoint : TPoint;
begin
  if (X < (SidePanel.ClientWidth)) and (X > (SidePanel.ClientWidth-10)) then
    Screen.Cursor := crSizeWE
  else
    Screen.Cursor := crDefault;

  if VbIsResizing then
  begin
    with TWinControl(Sender).Parent do
    begin
      GetCursorPos(LoNewPos);

      Screen.Cursor := crSizeNWSE;
      LoFrmPoint := ScreenToClient(Mouse.CursorPos);
      if (LoFrmPoint.X > CminWidth) and (LoFrmPoint.X < CmaxWidth) then
        Width := LoFrmPoint.X;
    end; // with
  end; // if
end;

procedure TForm1.cxTreeList1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if VbIsResizing then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    VbIsResizing := False;
  end;
end;

procedure TForm1.ElButtonEditPathEnter(Sender: TObject);
begin
  ElButtonEditPath.SelectAll;
  PanelPath.Visible := false;
end;

procedure TForm1.ElButtonEditPathExit(Sender: TObject);
begin
  PanelPath.Visible := True;
end;

procedure TForm1.ElButtonEditPathKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LoCurrentNode: TcxTreeListNode;
  LsSelectedPath: string;
  LArrPathItems: TArray<string>;
  LiI: Integer;
begin
  if (Key = VK_RETURN) then
  begin
   try
     LoCurrentNode := cxTreeList1.Root;
     LsSelectedPath := ElButtonEditPath.Text;

     if LsSelectedPath = EmptyStr then
        raise Exception.Create('Empty Path URL');

     LArrPathItems := LsSelectedPath.Split(['\']);
     for LiI := 0 to Length(LArrPathItems)-1 do
       LoCurrentNode := cxTreeList1.FindNodeByText(LArrPathItems[LiI], NameARcxTreeList1Column, LoCurrentNode);

     if LoCurrentNode <> nil then
       cxTreeList1.AbsoluteItems[LoCurrentNode.AbsoluteIndex].Selected := True;
     cxTreeList1.SetFocus;
   except on E: Exception do
     raise Exception.Create('Invalid Path URL');
   end; // try..except
  end; // if
end;

procedure TForm1.FillTree;
begin
  // Modules
  with cxTreeList1.Add do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Deparments';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·√ﬁ”«„';
    Values[ImagecxTreeList1Column.ItemIndex] := 14;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //PF
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Preferences';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·√⁄œ«œ« ';
    Values[ImagecxTreeList1Column.ItemIndex] := 0;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 4;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //GL
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'General Ledger';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·Õ”«»«  «·⁄«„…';
    Values[ImagecxTreeList1Column.ItemIndex] := 1;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 1;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //MV
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Monatory Vessels';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·√Ê⁄Ì… «·„«·Ì…';
    Values[ImagecxTreeList1Column.ItemIndex] := 2;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 7;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //SC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Stock Control';
    Values[NameARcxTreeList1Column.ItemIndex] := '√œ«—… «·„Œ“Ê‰';
    Values[ImagecxTreeList1Column.ItemIndex] := 3;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 8;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //SL
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Sales';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·„»Ì⁄« ';
    Values[ImagecxTreeList1Column.ItemIndex] := 4;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 10;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //PR
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Purchases';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·„‘ —Ì« ';
    Values[ImagecxTreeList1Column.ItemIndex] := 5;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 9;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //CIM
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'CIM';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·√œ«—… «·„—ﬂ“Ì… ··„Œ“Ê‰';
    Values[ImagecxTreeList1Column.ItemIndex] := 6;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 5;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //FA
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Fixed Assets';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·√’Ê· «·À«» …';
    Values[ImagecxTreeList1Column.ItemIndex] := 9;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 11;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //LC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Letter of Credit';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·√⁄ „«œ«  «·„” ‰œÌ…';
    Values[ImagecxTreeList1Column.ItemIndex] := 10;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 12;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //FC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Food Cost';
    Values[NameARcxTreeList1Column.ItemIndex] := ' ﬂ«·Ì› «·√ÿ⁄„…';
    Values[ImagecxTreeList1Column.ItemIndex] := 11;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 13;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //TC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Target & Comission';
    Values[NameARcxTreeList1Column.ItemIndex] := '«·⁄„Ê·«  Ê«· «—Ã ';
    Values[ImagecxTreeList1Column.ItemIndex] := 12;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 14;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;

  //PL
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Planning';
    Values[NameARcxTreeList1Column.ItemIndex] := '«· ŒÿÌÿ';
    Values[ImagecxTreeList1Column.ItemIndex] := 13;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 15;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
  end;


//  with cxTreeList1.Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Forms';
//
//  with cxTreeList1.Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Reports';
//
//  // forms
//  with cxTreeList1.Items[0].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Units';
//
//  with cxTreeList1.Items[0].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Items';
//
//  with cxTreeList1.Items[0].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Store';
//
//  // Reports
//  with cxTreeList1.Items[0].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Stock orders Report';
//
//  with cxTreeList1.Items[0].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Adjustments Report';
//
//  with cxTreeList1.Items[0].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Transfers Report';
//
//
//  with cxTreeList1.Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Forms';
//
//  with cxTreeList1.Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Reports';
//
//  // forms
//  with cxTreeList1.Items[1].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Batch Items';
//
//  with cxTreeList1.Items[1].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Break down transactions';
//
//  with cxTreeList1.Items[1].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Revenue centers';
//
//  // Reports
//  with cxTreeList1.Items[1].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Sessions Report';
//
//  with cxTreeList1.Items[1].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Depreciations Report';
//
//  with cxTreeList1.Items[1].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Food cost Report';
end;

procedure TForm1.FillTreeImageComboBox;
var
  LiI: integer;
begin
  for LiI := 0 to Menu24ImageList.Count-1 do
  begin
   with TcxCustomImageComboBoxProperties(ImagecxTreeList1Column.Properties).Items.Add do
   begin
     ImageIndex := LiI;
     Value := LiI;
   end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  LoCustomHint: TCustomHint;
  LiI: integer;
begin

  // Init
  VoHistoryList := TList<Integer>.Create;
  ViListIndex := -1;
  VbNavigate := false;

  // fill data
  FillTreeImageComboBox;
  //FillTree;

  // design
  if cxTreeList1.Count > 0 then
    cxTreeList1.Items[0].Selected := True;

  ElButtonEditPath.Width := Trunc(Screen.Width * 0.82);
  ElButtonEditSearch.Left := ElButtonEditPath.Left + ElButtonEditPath.Width + 10;

  // search button hint
  LoCustomHint := TCustomHint.Create(Self);
  LoCustomHint.Title := 'Search (Ctrl+F3)';
  ElButtonEditSearch.CustomHint := LoCustomHint;

  Image1.Stretch := true;  // to make it as large as Image1
  Image1.Proportional := true;  // to keep width/height ratio
  Image1.Picture.Bitmap:= nil; // clear previous image
  Menu24ImageList.GetBitmap(2, Image1.Picture.Bitmap);
end;

procedure TForm1.DoItemClick(Sender: TObject);
begin
  try
    VbNavigate := True;
    cxTreeList1.AbsoluteItems[TMenuItem(Sender).Tag].Selected := True;
  finally
    VbNavigate := false;
  end; // try..finally
end;

procedure TForm1.DoDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
var
  LsCaption: string;
  LiImageIndex: Integer;
begin
  with ACanvas do
  begin
    Pen.Style := psClear;
    Font.Color := clBlack;
    if Selected then
      Font.Style := [fsBold];

    LsCaption := TMenuItem(Sender).Caption;
    LiImageIndex := TMenuItem(Sender).ImageIndex;

    Canvas.Rectangle(ARect.Left, ARect.Top, ARect.Right + 1, ARect.Bottom + 1);

    if BiDiMode = bdLeftToRight then
      TextOut(5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption)
    else
      TextOut(ARect.Right - TextWidth(LsCaption) - 5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption);


    with BoundsRect do
      Menu24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, LiImageIndex, dsTransparent, itImage)

  end;//with
end;


procedure TForm1.DoLabelClick(Sender: TObject);
begin
  cxTreeList1.AbsoluteItems[TLabel(Sender).Tag].Selected := True;
  cxTreeList1.SetFocus;
end;

procedure TForm1.DoLinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  cxTreeList1.AbsoluteItems[TLinkLabel(Sender).Tag].Selected := True;
  cxTreeList1.SetFocus;
end;

procedure TForm1.LabelMouseEnter(Sender: TObject);
begin
  (TLabel(Sender)).Font.Style := (TLabel(Sender)).Font.Style+[fsUnderLine];
  (TLabel(Sender)).Cursor := crHandPoint;
end;

procedure TForm1.LabelMouseLeave(Sender: TObject);
begin
  (TLabel(Sender)).Font.Style := (TLabel(Sender)).Font.Style-[fsUnderLine];
  (TLabel(Sender)).Cursor := crDefault;
end;

procedure TForm1.LinkLabel1Click(Sender: TObject);
begin
  ShowMessage('Clicked');
end;

procedure TForm1.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShowMessage('Clicked');
end;

procedure TForm1.LoadTreeButtonClick(Sender: TObject);
begin
  cxTreeList1.LoadFromFile('treeitems1.txt');
end;

procedure TForm1.RzToolButtonForwardClick(Sender: TObject);
begin
  try
    VbNavigate := true;
    if cxTreeList1.Count > 0 then
    begin
      if ViListIndex < VoHistoryList.Count then
        Inc(ViListIndex);

      AdjustNavBtns;
      cxTreeList1.AbsoluteItems[VoHistoryList[ViListIndex]].Selected := True;
    end;
  finally
    VbNavigate := false;
  end;
end;

procedure TForm1.RzToolButtonHistoryClick(Sender: TObject);
begin
  HistoryPopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm1.RzToolButtonPreviousClick(Sender: TObject);
begin
  try
    VbNavigate := true;
    if cxTreeList1.Count > 0 then
    begin
      if ViListIndex > 0 then
        dec(ViListIndex);

      AdjustNavBtns;
      cxTreeList1.AbsoluteItems[VoHistoryList[ViListIndex]].Selected := True;
    end;
  finally
    VbNavigate := false;
  end;
end;

procedure TForm1.SidePanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TWinControl) then
  begin
    VbIsResizing := True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(VoOldPos);
  end;
end;

procedure TForm1.SidePanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  CminWidth = 200;
  CmaxWidth = 400;
var
  LoNewPos: TPoint;
  LoFrmPoint : TPoint;
begin
  if (X < (SidePanel.ClientWidth)) and (X > (SidePanel.ClientWidth-10)) then
    Screen.Cursor := crSizeWE
  else
    Screen.Cursor := crDefault;

  if VbIsResizing then
  begin
    with TWinControl(Sender) do
    begin
      GetCursorPos(LoNewPos);

      Screen.Cursor := crSizeNWSE;
      LoFrmPoint := ScreenToClient(Mouse.CursorPos);
      if (LoFrmPoint.X > CminWidth) and (LoFrmPoint.X < CmaxWidth) then
        Width := LoFrmPoint.X;
    end; // with
  end; // if
end;

procedure TForm1.SidePanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if VbIsResizing then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    VbIsResizing := False;
  end;
end;


procedure FindFiles(FilesList: TStrings; StartDir, FileMask: string);
var
  SR: TSearchRec;
  DirList: TStrings;
  IsFound: Boolean;
  i: integer;
begin
  if StartDir[length(StartDir)] <> PathDelim then
    StartDir := StartDir + PathDelim;

  IsFound :=
    FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
  while IsFound do begin
    FilesList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  // Build a list of subdirectories
  DirList := TStringList.Create;
  IsFound := FindFirst(StartDir+'*.*', faAnyFile, SR) = 0;
  while IsFound do begin
    if ((SR.Attr and faDirectory) <> 0) and
         (SR.Name[1] <> '.') then
      DirList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  // Scan the list of subdirectories
  for i := 0 to DirList.Count - 1 do
    FindFiles(FilesList, DirList[i], FileMask);

  DirList.Free;
end;

procedure TForm1.DoClickPathBarItem(Sender: TObject);
begin
  cxTreeList1.AbsoluteItems[TRzPathItem(Sender).Tag].Selected := True;
  cxTreeList1.SetFocus;
end;

procedure TForm1.MeasureMenuItem(Sender: TObject;
  ACanvas: TCanvas; var Width, Height: Integer);
begin
  with ACanvas do
  begin
    Font.Color := not clHighlight;
    Font.Style := [fsBold];

    Width := TextWidth(TMenuItem(Sender).Caption) + 30;
    Height := TextHeight(TMenuItem(Sender).Caption) + 10;
  end;//with
end;

procedure TForm1.AdvancedDrawMenuItem(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
var
  LsCaption : string;
  LiImageIndex: Integer;
begin
  LsCaption := TMenuItem(Sender).Caption ;
  Delete(LsCaption,POS('&',TMenuItem(Sender).Caption), 1);
  LiImageIndex := TMenuItem(Sender).ImageIndex;

  with ACanvas, BoundsRect do
  begin
    Pen.Style := psClear;
    Font.Color := clBlack;
    if odChecked in State then
      Font.Style := [fsBold];

    Canvas.Rectangle(ARect.Left, ARect.Top, ARect.Right + 1, ARect.Bottom + 1);

    if BiDiMode = bdLeftToRight then
      TextOut(5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption)
    else
      TextOut(ARect.Right - TextWidth(LsCaption) - 5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption);

    //with Bounds do
      //Canvas.Rectangle(Left, Top, Right, Bottom + 1);

      Menu24ImageList.Draw(Canvas, 5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LiImageIndex, dsTransparent, itImage)
      //Menu24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, LiImageIndex, dsTransparent, itImage)
  end;//with
end;


end.
