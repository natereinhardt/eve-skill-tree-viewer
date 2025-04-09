
<script setup>
import VueTree from "@ssthouse/vue3-tree-chart";
import "@ssthouse/vue3-tree-chart/dist/vue3-tree-chart.css";

</script>
<template>
    <div class='container'>
        <vue-tree style="width: 8000px; height: 6000px; border: 1px solid gray;" :dataset="Shields" :config="treeConfig"
            linkStyle="straight">
            <template v-slot:node="{ node, collapsed }">
                <div class="rich-media-node" :style="{ border: collapsed ? '2px solid grey' : '' }">
                    <span style="padding: 4px 0; font-weight: bold;">{{ node.name }}</span>
                </div>
            </template>
        </vue-tree>
    </div>
</template>
<script>
export default {
  name: 'treemap',
  data() {
return {
  Shields: {
    name: 'Shields',
    children: [
      {
        name: 'Science',
        customID: 3402,
        children: [
          {
            name: 'Shield Emission Systems',
            customID: 3422,
            children: [
              {
                name: 'Capital Shield Emission Systems',
                customID: 24571,
                children: [
                  {
                    name: 'Invulnerability Core Operation',
                    customID: 44067
                  }
                ]
              }
            ]
          },
          {
            name: 'Shield Upgrades',
            customID: 3425
          }
        ]
      },
      {
        name: 'Power Grid Management',
        customID: 3413,
        children: [
          {
            name: 'Capital Shield Emission Systems',
            customID: 24571,
            children: [
              {
                name: 'Invulnerability Core Operation',
                customID: 44067
              }
            ]
          },
          {
            name: 'Shield Operation',
            customID: 3416,
            children: [
              {
                name: 'Shield Compensation',
                customID: 21059
              },
              {
                name: 'Explosive Shield Compensation',
                customID: 12367
              },
              {
                name: 'Kinetic Shield Compensation',
                customID: 12366
              },
              {
                name: 'Capital Shield Operation',
                customID: 21802
              },
              {
                name: 'Thermal Shield Compensation',
                customID: 11566
              },
              {
                name: 'EM Shield Compensation',
                customID: 12365
              }
            ]
          },
          {
            name: 'Shield Emission Systems',
            customID: 3422,
            children: [
              {
                name: 'Capital Shield Emission Systems',
                customID: 24571,
                children: [
                  {
                    name: 'Invulnerability Core Operation',
                    customID: 44067
                  }
                ]
              }
            ]
          },
          {
            name: 'Shield Management',
            customID: 3419,
            children: [
              {
                name: 'Capital Shield Operation',
                customID: 21802
              }
            ]
          },
          {
            name: 'Shield Upgrades',
            customID: 3425
          },
          {
            name: 'Capital Shield Operation',
            customID: 21802
          },
          {
            name: 'Tactical Shield Manipulation',
            customID: 3420,
            children: [
              {
                name: 'Invulnerability Core Operation',
                customID: 44067
              }
            ]
          }
        ]
      }
    ],
    links: [
      {
        parent: 3416,
        child: 21059
      },
      {
        parent: 3419,
        child: 21802
      },
      {
        parent: 3416,
        child: 12367
      },
      {
        parent: 3422,
        child: 24571
      },
      {
        parent: 3413,
        child: 24571
      },
      {
        parent: 3413,
        child: 3416
      },
      {
        parent: 3413,
        child: 3422
      },
      {
        parent: 3402,
        child: 3422
      },
      {
        parent: 3413,
        child: 3419
      },
      {
        parent: 3413,
        child: 3425
      },
      {
        parent: 3402,
        child: 3425
      },
      {
        parent: 3416,
        child: 12366
      },
      {
        parent: 3416,
        child: 21802
      },
      {
        parent: 3416,
        child: 11566
      },
      {
        parent: 24571,
        child: 44067
      },
      {
        parent: 3416,
        child: 12365
      },
      {
        parent: 3420,
        child: 44067
      },
      {
        parent: 3413,
        child: 21802
      },
      {
        parent: 3413,
        child: 3420
      }
    ],
    identifier: 'customID'
  },
  treeConfig: {
    nodeWidth: 120,
    nodeHeight: 80,
    levelHeight: 200
  }
}
  }
}
</script>

<style scoped lang="less">
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.rich-media-node {
    width: 500px;
    padding: 5px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
    color: white;
    background-color: #f7c616;
    border-radius: 4px;
}
</style>