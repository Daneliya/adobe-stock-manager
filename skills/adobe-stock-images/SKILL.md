---
name: adobe-stock-images
description: 按用户指定的分类、数量和用途生成或整理 Adobe Stock 投稿用栅格图片，核验 Adobe 官方投稿规格，并逐图交付主题、关键字和可下载图片。适用于商业图库照片和栅格插画。
---

# Adobe Stock 图片投稿包

1. 按用户指定的题材分类、张数、构图和风格制作。题材分组和 Contributor 门户里的投稿分类分别处理。用户没指定张数时，每类先做一张。生成前明确每张图的买家用途，同一批选用实质不同的场景。
2. 每次制作投稿文件前打开下方 Adobe 官方文档。按实际素材类型核实当前规格、元数据和内容规则。若规则变更，以现行文档为准并同步调整校验。无法核实时，注明待核实的项目。
3. 使用可用的图片生成工具或用户提供的素材。优先取得原生分辨率达标的图。导出高质量 sRGB JPEG，嵌入 sRGB 配置文件。保持原始比例，保留源文件。若原图不足 4 MP，优先重新生成或换源。仅在官方规则允许且放大后仍清晰时使用放大，并告知用户。禁止用拉伸或空白填充凑尺寸。
4. 对每个最终交付文件执行 `scripts/check-jpeg.sh 文件路径`。当前标准照片规格为真实 JPEG、sRGB、宽×高 4,000,000–100,000,000 像素、最大 45 MB。脚本使用 45,000,000 字节作为保守上限。栅格插画须同时满足其专属官方规格。以导出文件实测为准，失败则修正后重验。用 100% 比例检查清晰度、压缩瑕疵、变形、手部和结构错误、设备逻辑、乱码、水印及商标。技术检查和目视检查均通过才交付为投稿文件。
5. 确认素材与生成工具条款允许商业图库授权。提示词、标题、关键字避开官方禁止的姓名、受保护作品、角色及第三方 IP。真实人物、可识别财产按 Adobe 规则核对授权文件。AI 图按外观选 Photos 或 Illustrations，并提示勾选 **Created using generative AI tools**。虚构人物或财产按官方规则选择相应复选框。权利或必要授权无法确认时标明待补。
6. 根据最终画面编写标题和关键字。标题自然简明，最多 70 字符。标题和关键字使用同一种语言，默认英文。关键字按相关度排序，用逗号分隔，优先主体和用途。Adobe 建议 15–25 个，词少时保留准确项。门户类别按当前官方列表与画面匹配。

## 固定交付格式

按用户的题材分类分组，每张图单独交付以下三个字段。

- **主题** — 可直接复制的投稿标题。
- **关键字** — 该图专属的逗号分隔关键字。
- **具体图片** — 交付实际 JPEG 的预览或下载链接，并标明实测像素尺寸、MP 和文件大小。文件不可用时说明缺项和原因。

AI 标注和授权状态可在批次末尾统一说明。除非用户已明确授权提交，否则工作止于生成本地投稿包。通过本地检查的文件仍需 Adobe 审核。

## Adobe 官方文档

- [照片技术和法律要求](https://helpx.adobe.com/stock/contributor/submit-your-content/submit-photos/technical-legal-requirements-photo-submission.html)
- [各种素材类型的上传要求](https://helpx.adobe.com/stock/contributor/content-policies-guidelines/content-policies/content-upload-guidelines.html)
- [生成式 AI 投稿规则](https://helpx.adobe.com/ee/stock/contributor/submit-your-content/submit-generative-ai-content/generative-ai-content-guidelines.html)
- [标题与关键字](https://helpx.adobe.com/stock/contributor/help/keyword-tutorial.html)
